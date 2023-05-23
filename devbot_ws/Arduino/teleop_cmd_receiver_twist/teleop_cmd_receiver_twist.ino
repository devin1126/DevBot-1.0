/*
  Dev 'Additions' Notes:
  - Added delay in 'STOP' function to reduce odometry drag
  - Robot can only turn at max (or near) speed to compensate for on-board load
  - Current motor controller cannot achieve precise voltage levels for sharp turns (only translation and in-place rotations feasible)
*/

// Importing Needed Header Files
#include <ros.h>
#include <devbot_teleop/CMD.h>
#include <base_controller_twist_converter/vel_data.h>

// Defining Motor Controller Pins
#define IN1 4
#define IN2 6
#define IN3 8
#define IN4 11
#define ENA 9
#define ENB 7
#define lin_speed 200
#define turn_speed 255

ros::NodeHandle nh;

// defining ROS twist message
base_controller_twist_converter::vel_data twist_msg;

// defining wheel encoder timer
unsigned long start_time = 0;
unsigned long end_time = 0;

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

// ROS Teleop Command Receiver
void vel_cmd_receive( const devbot_teleop::CMD& vel_msg){
  String vel_msg_str = String(vel_msg.direction);

  if (vel_msg_str == "forward"){
    forward();
    delay(0.1);
  } 
  else if (vel_msg_str == "backward") {
    backward();
    delay(0.1);
  }
  else if (vel_msg_str == "right") {
    right();
    delay(0.1);
  }
  else if (vel_msg_str == "left") {
    left();
    delay(0.1);
  }
  else {
    STOP();
  }
}

// Initializing ROS Publisher & Subscriber
ros::Subscriber<devbot_teleop::CMD> vel_sub("vel_cmd", &vel_cmd_receive);
ros::Publisher twist_pub("twist", &twist_msg);

// Local Twist Message Publisher
void velocity_publisher(float vel_data[]) {
   if(millis()<end_time)
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
    start_time=millis();
    end_time=start_time+200;
  }
}

void setup() {
  // ROS Initialization
  nh.initNode();
  nh.subscribe(vel_sub);
  nh.advertise(twist_pub);

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
  start_time=millis();
  end_time=start_time+200;
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

void forward() {
  ismoving = true;
  rw_isforward = true;
  lw_isforward = true;
  analogWrite(ENA, lin_speed);
  analogWrite(ENB, lin_speed);
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);

}

void backward() {
  ismoving = true;
  rw_isforward = false;
  lw_isforward = false;
  analogWrite(ENA, lin_speed);
  analogWrite(ENB, lin_speed);
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);

}


void right() {
  ismoving = true;
  rw_isforward = false;
  lw_isforward = true;
  analogWrite(ENA, turn_speed);
  analogWrite(ENB, turn_speed);
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW); 
}


void left() {
  ismoving = true;
  rw_isforward = true;
  lw_isforward = false;
  analogWrite(ENA, turn_speed);
  analogWrite(ENB, turn_speed);
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
}

void STOP() {
  digitalWrite(ENA, LOW);
  digitalWrite(ENB, LOW);
  
  // delay to capture full deceleration of wheels (helps odometry estimation)
  delay(500);
  ismoving = false;
}
