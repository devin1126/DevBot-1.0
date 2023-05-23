/*
  Dev 'Additions' Notes:
  - Added custom ROS message to track parameters of controller (wheel_info)
  - Added delay in 'STOP' function to reduce odometry drag
  - Robot can only turn at max (or near) speed to compensate for on-board load
  - Current motor controller cannot achieve precise voltage levels for sharp turns (only translation and in-place rotations feasible)
  - Added 'prevCommand' to track motion commands and prevent quick movements for better odometry estimation
  - Need to improve on current feedback controller in-use (i.e. PID)
*/

// Importing Needed Header Files
#include <ros.h>
#include <geometry_msgs/Twist.h>
#include <base_controller_twist_converter/vel_data.h>
#include <devbot_navigation/wheel_info.h>

// Defining Motor Controller Pins & Related Parameters
#define IN1 4
#define IN2 6
#define IN3 8
#define IN4 11
#define ENA 9
#define ENB 7
#define maxVolt 200
#define minVolt 70
#define turnSpeed 255

ros::NodeHandle nh;

// defining needed ROS messages
base_controller_twist_converter::vel_data twist_msg;
devbot_navigation::wheel_info wheel_info_msg;

// defining wheel encoder timer
unsigned long encoder_start_time = 0;
unsigned long encoder_end_time = 0;

bool ismoving; // bool that checks if robot is moving

// Right Wheel Sensor Parameters
#define rw_sensor 2
int rw_steps=0;
float rw_steps_old=0;
float rw_temp=0;
float rw_rps=0;
float rw_mps=0;
bool rw_isforward;

// Left Wheel Sensor Parameters
#define lw_sensor 3
int lw_steps=0;
float lw_steps_old=0;
float lw_temp=0;
float lw_rps=0;
float lw_mps=0;
bool lw_isforward;

// Geometry of Robot, Odometry, and Related Parameters
float radian = 2 * 3.141592654;        // radians value for conversions
float rad_wheel = 0.03095;             // radius of wheels (r_R = r_L)
float chassis_width = 0.1521;          // width of robot chassis (2b)
float vel_data[2];

// Control Parameters
int controlSigR = 100; 
int controlSigL = 100;
float error_R, error_L;
String prevCommand;

// Initializing ROS Velocity Publishers
ros::Publisher twist_pub("twist", &twist_msg);
ros::Publisher wheel_info_pub("wheel_info", &wheel_info_msg);

// DevBot AutoNav Controller
void base_controller( const geometry_msgs::Twist& vel_cmd){
  
  // Parsing Velocity Command Messages
  float lin_vel = vel_cmd.linear.x;
  float ang_vel = vel_cmd.angular.z;

  // Filtering out sharp linear+angular velocity commands (DevBot cannot handle well)
  if (lin_vel != 0 && ang_vel > 0.4) {
    lin_vel = 0;
  }
  
  // Calculating Left & Right Setpoint Velocities (using wheel odometry matrix equation)
  float r_set = (32.31018*lin_vel) + (2.45719*ang_vel);
  float l_set = (32.31018*lin_vel) - (2.45719*ang_vel);

  error_R = r_set - rw_rps;
  error_L = l_set - lw_rps;
  
  int deltaVoltR = 0;
  int deltaVoltL = 0;

  if (abs(error_R) > 0.5 || abs(error_L) > 0.5) {

      // Determining voltage correction in right wheels
      if (abs(error_R) > 5) {
        deltaVoltR = 50;
      } 
      else if (abs(error_R) > 2 && abs(error_R) < 5) {
        deltaVoltR = 10;
      }
      else if (abs(error_R) > 1 && abs(error_R) < 2) {
        deltaVoltR = 5;
      }
      else if (abs(error_R) > 0.5 && abs(error_R) < 1) {
        deltaVoltR = 1;
      }

      // Determining voltage correction in left wheels
      if (abs(error_L) > 5) {
        deltaVoltL = 50;
      } 
      else if (abs(error_L) > 2 && abs(error_L) < 5) {
        deltaVoltL = 10;
      }
      else if (abs(error_L) > 1 && abs(error_L) < 2) {
        deltaVoltL = 5;
      }
      else if (abs(error_L) > 0.5 && abs(error_L) < 1) {
        deltaVoltL = 1;
      }

      // Direction check
      if (r_set > 0 && l_set > 0) {
        if (error_R < 0) {
          deltaVoltR = -deltaVoltR;
        }
        if (error_L < 0) {
          deltaVoltL = -deltaVoltL;
        }
      }
      else if (r_set < 0 && l_set > 0) {
        if (error_R > 0) {
          deltaVoltR = -deltaVoltR;
        }
        if (error_L < 0) {
          deltaVoltL = -deltaVoltL;
        }
      }
      else if (r_set > 0 && l_set < 0) {
        if (error_R < 0) {
          deltaVoltR = -deltaVoltR;
        }
        if (error_L > 0) {
          deltaVoltL = -deltaVoltL;
        }
      }
      else if (r_set < 0 && l_set < 0) {
        if (error_R > 0) {
          deltaVoltR = -deltaVoltR;
        }
        if (error_L > 0) {
          deltaVoltL = -deltaVoltL;
        }
      }
  }
  
  // Sending Velocity Adjustments to Control Signals
  controlSigR += deltaVoltR;
  controlSigL += deltaVoltL;

  // Preventing Motor Wind-Up/Wind-Down
  if (controlSigR > maxVolt) {
    controlSigR = maxVolt;
  }
  else if (controlSigR < minVolt) {
    controlSigR = minVolt;
  }

  if (controlSigL > maxVolt) {
    controlSigL = maxVolt;
  }
  else if (controlSigL < minVolt) {
    controlSigL = minVolt;
  }

  // Capturing Voltage Levels, Commanded Velocities, and Actual Velocities for Both Wheels (Debugging Purposes)
  wheel_info_msg.wheel_volt_R = controlSigR;
  wheel_info_msg.wheel_volt_L = controlSigL;
  wheel_info_msg.wheel_cmd_R = r_set;
  wheel_info_msg.wheel_cmd_L = l_set;
  wheel_info_msg.wheel_vel_R = rw_rps;
  wheel_info_msg.wheel_vel_L = lw_rps;
  wheel_info_pub.publish(&wheel_info_msg);

  // Sending Motor Commands to Base
  if (r_set > 0 && l_set > 0) {
    forward(controlSigR, controlSigL);
    prevCommand = "forward";
    delay(0.1);
    }
  else if (r_set < 0 && l_set > 0) {
    // Prevent rapid change-in-direction for more odometry stability 
    if (prevCommand != "right") {
      STOP();
    }
    
    right(turnSpeed, turnSpeed);
    prevCommand = "right";
    delay(0.1);
    }
  else if (r_set > 0 && l_set < 0) {
    // Prevent rapid change-in-direction for more odometry stability 
    if (prevCommand != "left") {
      STOP();
    }
    
    left(turnSpeed, turnSpeed);
    prevCommand = "left";
    delay(0.1);
    }
  else if (r_set < 0 && l_set < 0) {
    backward(controlSigR, controlSigL);
    prevCommand = "backward";
    delay(0.1);
    }
  else {
    STOP();
  }
}

// Initializing DevBot Navigation Receiver
ros::Subscriber<geometry_msgs::Twist> vel_sub("cmd_vel", &base_controller);

// Local Twist Message Publisher
void velocity_publisher(float vel_data[]) {
   if(millis()<encoder_end_time)
   {
     
     if(digitalRead(rw_sensor))
     {
       rw_steps=rw_steps+1; 
       while(digitalRead(rw_sensor));
     }
     if(digitalRead(lw_sensor))
     {
       lw_steps=lw_steps+1; 
       while(digitalRead(lw_sensor));
     }
   }
   else {
    // Updating Right Wheel Parameters
    rw_temp=rw_steps-rw_steps_old;
    rw_steps_old=rw_steps;
    rw_rps=(rw_temp/20) * 5; // 200 milliseconds * 5 = 1 second (5 Hz)
    rw_rps = rw_rps * radian; // radians/sec (one rotation = 2 * pi radians)
   
    // Updating Right Wheel Parameters
    lw_temp=lw_steps-lw_steps_old;
    lw_steps_old=lw_steps;
    lw_rps=(lw_temp/20) * 5; // 200 milliseconds * 5 = 1 second (5 Hz)
    lw_rps = lw_rps * radian; // radians/sec (one rotation = 2 * pi radians)

    // Direction Check
    if(rw_isforward == false){
     rw_rps = -rw_rps;
    }
    if(lw_isforward == false){
     lw_rps = -lw_rps;
    }

    // Calculating Local Odometry from Wheel Velocities
    vel_data[0] = (rad_wheel * rw_rps + rad_wheel * lw_rps) / 2;              // Linear Velocity (m/s)
    vel_data[1] = (rad_wheel * rw_rps - rad_wheel * lw_rps) / chassis_width;  // Angular Velocity (rad/s)

    // Publishing Twist Message to Publisher
    twist_msg.linear_velocity = vel_data[0];
    twist_msg.angular_velocity = vel_data[1];
    twist_pub.publish(&twist_msg);

    // Updating Encoder Time Parameters
    encoder_start_time=millis();
    encoder_end_time=encoder_start_time+200;
  }
}

void setup() {
  // ROS Initialization
  nh.initNode();
  nh.subscribe(vel_sub);
  nh.advertise(twist_pub);
  nh.advertise(wheel_info_pub);

  // Wheel Encoder Initialization
  pinMode(rw_sensor, INPUT_PULLUP);
  pinMode(lw_sensor, INPUT_PULLUP);

  // Motor Controller Initialization
  pinMode(IN1, OUTPUT); 
  pinMode(IN2, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);
  pinMode(ENA, OUTPUT);
  pinMode(ENB, OUTPUT);

  ismoving = false;
  digitalWrite(ENA, LOW);
  digitalWrite(ENB, LOW);

  // Initializing Encoder Time Parameters
  encoder_start_time=millis();
  encoder_end_time=encoder_start_time+200;
}

void loop() {
  nh.spinOnce();

  if(!ismoving) {
    twist_msg.linear_velocity = 0;
    twist_msg.angular_velocity = 0;
    twist_pub.publish(&twist_msg);
  }
  else {
    velocity_publisher(vel_data);
  }
}

void forward(int wheel_voltR, int wheel_voltL) {
  ismoving = true;
  rw_isforward = true;
  lw_isforward = true;
  analogWrite(ENA, wheel_voltR);
  analogWrite(ENB, wheel_voltL);
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);

}

void backward(int wheel_voltR, int wheel_voltL) {
  ismoving = true;
  rw_isforward = false;
  lw_isforward = false;
  analogWrite(ENA, wheel_voltR);
  analogWrite(ENB, wheel_voltL);
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);

}


void right(int wheel_voltR, int wheel_voltL) {
  ismoving = true;
  rw_isforward = false;
  lw_isforward = true;
  analogWrite(ENA, wheel_voltR);
  analogWrite(ENB, wheel_voltL);
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW); 
}


void left(int wheel_voltR, int wheel_voltL) {
  ismoving = true;
  rw_isforward = true;
  lw_isforward = false;
  analogWrite(ENA, wheel_voltR);
  analogWrite(ENB, wheel_voltL);
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
}

void STOP() {
  digitalWrite(ENA, LOW);
  digitalWrite(ENB, LOW);

  // delay to capture full deceleration of wheels (helps odometry calculation)
  delay(500);
  ismoving = false;
}
