#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>

#include <ros.h>
#include <bno055_imu_ros/bno055.h>

ros::NodeHandle nh;

// defining ROS sensor message
bno055_imu_ros::bno055 imu_msg;

// establishing ROS node publisher
ros::Publisher imu_pub("bno055", &imu_msg);

// calling default BNO055 IMU instance & offsets
Adafruit_BNO055 bno = Adafruit_BNO055();
adafruit_bno055_offsets_t offsets;

// needed conversion vars
float deg_to_rad = 3.141592654 / 180;

void setup(void){
  
  Serial.begin(57600);

  bno.begin(OPERATION_MODE_IMUPLUS);  // 6-DOF IMU mode

  Serial.print("Operation Mode Detected:\t");
  Serial.print(bno.getMode());
  
  if(!bno.begin()) {
    Serial.print("No BNO055 detected. Check your connections.");
    while(1);
  }
  
  delay(1000);

  bno.setExtCrystalUse(true);

  // setting offsets for imu (custom for each IMU)
  offsets.gyro_offset_x = 1;
  offsets.gyro_offset_y = -3;
  offsets.gyro_offset_z = -2;
  offsets.accel_offset_x = -45;
  offsets.accel_offset_y = -9;
  offsets.accel_offset_z = -51;
  offsets.accel_radius = 1000;

  bno.getSensorOffsets(offsets);

  // initializing ROS node and its publishing message
  nh.initNode();
  nh.advertise(imu_pub);
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

    // Publishing IMU message
    imu_pub.publish(&imu_msg); 
    
}
