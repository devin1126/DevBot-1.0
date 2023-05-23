/*
  In this script, LCD is used to display current teleoperation command
  and the current heading of the robot calculated directly from IMU
*/

#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>
#include <LiquidCrystal_I2C.h>
#include <math.h>

#include <ros.h>
#include <bno055_imu_ros/bno055.h>
#include <devbot_teleop/CMD.h>

ros::NodeHandle nh;

// defining ROS sensor messages
bno055_imu_ros::bno055 imu_msg;

// calling default BNO055 IMU instance & offsets
Adafruit_BNO055 bno = Adafruit_BNO055();
adafruit_bno055_offsets_t offsets;

// calling 1602 LCD instance
LiquidCrystal_I2C lcd(0x27, 16, 2);

// needed utility vars 
float deg_to_rad = 3.141592654 / 180;
float yaw = 0.0;

// LCD callback function
void lcdCb(const devbot_teleop::CMD& vel_msg) {
  String vel_msg_str = String(vel_msg.direction);
  if (vel_msg_str == "forward"){
    lcd.setCursor(3,0);
    lcd.print("Dir: Forward!");
    delay(1);
  } 
  else if (vel_msg_str == "backward") {
    lcd.setCursor(3,0);
    lcd.print("Dir: Back!");
    delay(1);
  }
  else if (vel_msg_str == "right") {
    lcd.setCursor(3,0);
    lcd.print("Dir: Right!");
    delay(1);
  }
  else if (vel_msg_str == "left") {
    lcd.setCursor(3,0);
    lcd.print("Dir: Left!");
    delay(1);
  }
  else {
    lcd.setCursor(3,0);
    lcd.print("Dir:            ");
  }
}

// establishing ROS node publisher & subscriber
ros::Publisher imu_pub("bno055", &imu_msg);
ros::Subscriber<devbot_teleop::CMD> vel_sub("vel_cmd", &lcdCb);

void setup(void){
  
  Serial.begin(57600);
  
  // initializing BNO055 IMU sensor
  bno.begin(OPERATION_MODE_IMUPLUS);

  // initializing 1602 LCD 
  lcd.begin();
  lcd.clear();
  
  if(!bno.begin()) {
    Serial.print("No BNO055 detected. Check your connections.");
    while(1);
  }
  
  delay(1000);

  bno.setExtCrystalUse(true);

  // setting acceleration offsets for imu
  offsets.accel_offset_x = -45;
  offsets.accel_offset_y = -9;
  offsets.accel_offset_z = -51;
  offsets.accel_radius = 1000;

  bno.getSensorOffsets(offsets);

  // initializing ROS node and its publishing message
  nh.initNode();
  nh.advertise(imu_pub);
  nh.subscribe(vel_sub);
}

void loop(void){

    nh.spinOnce();
  
    // Possible vector values can be:
    // - VECTOR_ACCELEROMETER - m/s^2
    // - VECTOR_MAGNETOMETER  - uT
    // - VECTOR_GYROSCOPE     - rad/s
    // - VECTOR_EULER         - degrees
    // - VECTOR_LINEARACCEL   - m/s^2
    // - VECTOR_GRAVITY       - m/s^2
    
    // Quaternion data
    imu::Quaternion quat = bno.getQuat();
    imu_msg.orientation.x = quat.x();
    imu_msg.orientation.y = quat.y();
    imu_msg.orientation.z = quat.z();
    imu_msg.orientation.w = quat.w();

    // Gyro data (rad/s)
    imu::Vector<3> body_rates = bno.getVector(bno.VECTOR_GYROSCOPE);
    imu_msg.body_rates.x = 0.0;
    imu_msg.body_rates.y = 0.0;
    imu_msg.body_rates.z = body_rates.z() * deg_to_rad;
    
    // Linear Acceleration data
    imu::Vector<3> accel = bno.getVector(bno.VECTOR_LINEARACCEL);
    imu_msg.linear_acceleration.x = -accel.y();
    imu_msg.linear_acceleration.y = 0.0;
    imu_msg.linear_acceleration.z = 0.0;

    // Publishing IMU message & saving yaw message
    imu_pub.publish(&imu_msg); 
    yaw = quat_to_yaw(quat.w(), quat.x(), quat.y(), quat.z());

    String yaw_msg_str = String(yaw);
    lcd.setCursor(3,1);
    lcd.print("Yaw: "+ yaw_msg_str);
}

float quat_to_yaw(float q0, float q1, float q2, float q3) {
    float first_term = 2 * (q0 * q3 + q1 * q2);
    float second_term = 1 - 2 * (pow(q2, 2) + pow(q3, 2));

    // computing and returning yaw of robot in degrees
    float yaw_deg = atan2(first_term, second_term) * pow(deg_to_rad, -1);
    return yaw_deg;
}
