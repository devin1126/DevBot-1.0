#include <ros/ros.h>
#include <bno055_imu_ros/bno055.h>
#include <sensor_msgs/Imu.h>

ros::Publisher imuPub;

sensor_msgs::Imu imu_msg;


void imuCb(const bno055_imu_ros::bno055::ConstPtr &msg){

  bool imu_subscribed  = (imuPub.getNumSubscribers() > 0);

  if (imu_subscribed){

    ros::Time sensor_data_time = ros::Time::now();
    imu_msg.header.stamp = sensor_data_time;

    imu_msg.orientation.w = msg->orientation.w;
    imu_msg.orientation.x = msg->orientation.x;
    imu_msg.orientation.y = msg->orientation.y;
    imu_msg.orientation.z = msg->orientation.z;

    imu_msg.angular_velocity.x = msg->body_rates.x;
    imu_msg.angular_velocity.y = msg->body_rates.y;
    imu_msg.angular_velocity.z = msg->body_rates.z;

    imu_msg.linear_acceleration.x = msg->linear_acceleration.x;
    imu_msg.linear_acceleration.y = msg->linear_acceleration.y;
    imu_msg.linear_acceleration.z = msg->linear_acceleration.z;

    imuPub.publish(imu_msg);
  }
}

int main(int argc, char** argv){

    ros::init(argc, argv, "bno055_imu_converter");

    ros::NodeHandle nh;
    ros::NodeHandle pnh("~");

    double linear_acceleration_stdev, angular_velocity_stdev;
    std::string frame_id;

    ros::param::param<double>("~linear_acceleration_stdev", linear_acceleration_stdev, sqrt(0.6));
    ros::param::param<double>("~angular_velocity_stdev", angular_velocity_stdev, sqrt(0.003));
    ros::param::param<std::string>("~frame_id", frame_id, std::string("imu_link"));

    double linear_acceleration_cov = linear_acceleration_stdev * linear_acceleration_stdev;
    double angular_velocity_cov = angular_velocity_stdev * angular_velocity_stdev;


    imu_msg.header.frame_id = frame_id;

    imu_msg.orientation_covariance[0] = 0.0002;
    imu_msg.orientation_covariance[4] = 0.0002;
    imu_msg.orientation_covariance[8] = 0.0002;


    // Angular velocity entries are not filled, so set to -1.0
    imu_msg.angular_velocity_covariance[0] = angular_velocity_cov; //angular_velocity_cov;
    imu_msg.angular_velocity_covariance[4] = angular_velocity_cov;
    imu_msg.angular_velocity_covariance[8] = angular_velocity_cov;

    // Linear acceleration entries are not filled, so set to -1.0
    imu_msg.linear_acceleration_covariance[0] = linear_acceleration_cov;
    imu_msg.linear_acceleration_covariance[4] = linear_acceleration_cov;
    imu_msg.linear_acceleration_covariance[8] = linear_acceleration_cov;

    imuPub = pnh.advertise<sensor_msgs::Imu>("imu", 10);

    ros::Subscriber imuSub = nh.subscribe("bno055", 10, imuCb);
    
    ros::spin();

    return(0);
}

