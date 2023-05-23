//=================================================================================================
// Copyright (c) 2014, Christian Rose, TU Darmstadt
// All rights reserved.

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the Simulation, Systems Optimization and Robotics
//       group, TU Darmstadt nor the names of its contributors may be used to
//       endorse or promote products derived from this software without
//       specific prior written permission.

// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//=================================================================================================

#include <ros/ros.h>
#include <mpu6050_imu_ros/mpu6050.h>
#include <sensor_msgs/Imu.h>

ros::Publisher imuPub;

sensor_msgs::Imu imu_msg;


void imuCb(const mpu6050_imu_ros::mpu6050::ConstPtr &msg){

  bool imu_subscribed  = (imuPub.getNumSubscribers() > 0);

  if (imu_subscribed){

    ros::Time sensor_data_time = ros::Time::now() - ros::Duration(0.002);
    imu_msg.header.stamp = sensor_data_time;

    imu_msg.orientation.w = msg->orientation.w;
    imu_msg.orientation.x = msg->orientation.x;
    imu_msg.orientation.y = msg->orientation.y;
    imu_msg.orientation.z = msg->orientation.z;

    imu_msg.angular_velocity.x = msg->body_rates.x;
    imu_msg.angular_velocity.y = msg->body_rates.y;
    imu_msg.angular_velocity.z = msg->body_rates.z;

    imu_msg.linear_acceleration.x = 0; // no linear acceleration readings from mpu6050
    imu_msg.linear_acceleration.y = 0;
    imu_msg.linear_acceleration.z = 0;

    imuPub.publish(imu_msg);
    
  }
}

int main(int argc, char** argv){

    ros::init(argc, argv, "mpu6050_imu_converter");

    ros::NodeHandle nh;
    ros::NodeHandle pnh("~");

    double linear_acceleration_stdev, angular_velocity_stdev;
    std::string frame_id;

    ros::param::param<double>("~linear_acceleration_stdev", linear_acceleration_stdev, 0.06);
    ros::param::param<double>("~angular_velocity_stdev", angular_velocity_stdev, 0.005);
    ros::param::param<std::string>("~frame_id", frame_id, std::string("imu_link"));

    double linear_acceleration_cov = linear_acceleration_stdev * linear_acceleration_stdev;
    double angular_velocity_cov = angular_velocity_stdev * angular_velocity_stdev;


    imu_msg.header.frame_id = frame_id;

    imu_msg.orientation_covariance[0] = 0.1;
    imu_msg.orientation_covariance[4] = 0.1;
    imu_msg.orientation_covariance[8] = 0.1;


    // Angular velocity entries are not filled, so set to -1.0
    imu_msg.angular_velocity_covariance[0] = angular_velocity_cov; //angular_velocity_cov;
    imu_msg.angular_velocity_covariance[4] = angular_velocity_cov;
    imu_msg.angular_velocity_covariance[8] = angular_velocity_cov;

    // Linear acceleration entries are not filled, so set to -1.0
    imu_msg.linear_acceleration_covariance[0] = -1.0;
    imu_msg.linear_acceleration_covariance[4] = -1.0;
    imu_msg.linear_acceleration_covariance[8] = -1.0;

    imuPub = pnh.advertise<sensor_msgs::Imu>("imu", 10);

    ros::Subscriber imuSub = nh.subscribe("mpu6050", 10, imuCb);
    
    ros::spin();

    return(0);
}

