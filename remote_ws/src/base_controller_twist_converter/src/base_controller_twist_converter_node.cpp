#include <ros/ros.h>
#include <base_controller_twist_converter/vel_data.h>
#include <geometry_msgs/TwistWithCovarianceStamped.h>

ros::Publisher twistPub;

geometry_msgs::TwistWithCovarianceStamped twist_msg;

void twistCb(const base_controller_twist_converter::vel_data::ConstPtr &msg){

  bool twist_subscribed  = (twistPub.getNumSubscribers() > 0);

  if (twist_subscribed){

    ros::Time sensor_data_time = ros::Time::now();
    twist_msg.header.stamp = sensor_data_time;

    twist_msg.twist.twist.linear.x = msg->linear_velocity;
    twist_msg.twist.twist.linear.y = 0;
    twist_msg.twist.twist.angular.z = msg->angular_velocity;

    twistPub.publish(twist_msg);
  }
}

int main(int argc, char** argv){

    ros::init(argc, argv, "base_controller_twist_converter");

    ros::NodeHandle nh;

    double linear_velocity_stdev, angular_velocity_stdev;
    std::string frame_id;

    ros::param::param<double>("~linear_velocity_stdev", linear_velocity_stdev, sqrt(0.0006));
    ros::param::param<double>("~angular_velocity_stdev", angular_velocity_stdev, sqrt(0.2));
    ros::param::param<std::string>("~frame_id", frame_id, std::string("base_link"));

    double linear_velocity_cov = linear_velocity_stdev * linear_velocity_stdev;
    double angular_velocity_cov = angular_velocity_stdev * angular_velocity_stdev;

    twist_msg.header.frame_id = frame_id;

    // Setting Linear and Angular Velocity Covariances
    twist_msg.twist.covariance[0] = linear_velocity_cov;
    twist_msg.twist.covariance[35] = angular_velocity_cov;

    twistPub = nh.advertise<geometry_msgs::TwistWithCovarianceStamped>("wheel_twist", 10);

    ros::Subscriber twistSub = nh.subscribe("twist", 10, twistCb);
    
    ros::spin();

    return(0);
}