#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <base_controller_twist_converter/vel_data.h>
#include <nav_msgs/Odometry.h>
 
double V = 0;
double omega = 0;

void twistCb(const base_controller_twist_converter::vel_data::ConstPtr &msg){
  // Updating Velocity Readings
  V = msg->linear_velocity;
  omega = msg->angular_velocity;
}

int main(int argc, char** argv){
    ros::init(argc, argv, "odometry_publisher");  
    ros::NodeHandle nh;
    ros::Publisher odom_pub = nh.advertise<nav_msgs::Odometry>("wheel_odom", 20);
    ros::Subscriber twistSub = nh.subscribe("twist", 10, twistCb);
    tf::TransformBroadcaster odom_broadcaster;

    // Initializing State Variables wrt Odom Frame
    double x = 0.0;
    double y = 0.0;
    double theta = 0.0;

    // Setting Linear and Angular Velocity Covariances (Derived Empirically)
    double linear_velocity_stdev, angular_velocity_stdev;
    ros::param::param<double>("~linear_velocity_stdev", linear_velocity_stdev, sqrt(0.0006));
    ros::param::param<double>("~angular_velocity_stdev", angular_velocity_stdev, sqrt(0.2));

    double lin_vel_cov = linear_velocity_stdev * linear_velocity_stdev;
    double ang_vel_cov = angular_velocity_stdev * angular_velocity_stdev;

    // Setting Time Parameters
    ros::Time current_time, last_time;
    current_time = ros::Time::now();
    last_time = ros::Time::now();
   
    ros::Rate r(5.0);
    while(nh.ok()){
        ros::spinOnce();                    // check for incoming messages
        current_time = ros::Time::now();
   
        //Computing Odometry Given Velocity Parameters
        double dt = (current_time - last_time).toSec();
        double x_dot = (V * cos(theta));
        double y_dot = (V * sin(theta));
        double theta_dot = omega;
   
        x += x_dot * dt;
        y += y_dot * dt;
        theta += theta_dot * dt;
   
        // Converting Yaw State (theta) to Quaternion 
        geometry_msgs::Quaternion odom_quat = tf::createQuaternionMsgFromYaw(theta);
    
        // Publishing Transform from odom to base_link
        geometry_msgs::TransformStamped odom_tf_msg;
        odom_tf_msg.header.stamp = current_time;
        odom_tf_msg.header.frame_id = "odom";
        odom_tf_msg.child_frame_id = "base_link";
    
        odom_tf_msg.transform.translation.x = x;
        odom_tf_msg.transform.translation.y = y;
        odom_tf_msg.transform.translation.z = 0.0;
        odom_tf_msg.transform.rotation = odom_quat;
    
        // Broadcasting the Transform
        odom_broadcaster.sendTransform(odom_tf_msg);
   
        // Publishing Odometry Message
        nav_msgs::Odometry odom;
        odom.header.stamp = current_time;
        odom.header.frame_id = "odom";
    
        // Set the Pose
        odom.pose.pose.position.x = x;
        odom.pose.pose.position.y = y;
        odom.pose.pose.position.z = 0.0;
        odom.pose.pose.orientation = odom_quat;
   
        // Set the Velocity
        odom.child_frame_id = "base_link";
        odom.twist.twist.linear.x = x_dot;
        odom.twist.twist.linear.y = y_dot;
        odom.twist.twist.angular.z = theta_dot;

        // Set the Velocity Covariance Matrix
        odom.twist.covariance[0] = lin_vel_cov;
        odom.twist.covariance[7] = lin_vel_cov;
        odom.twist.covariance[14] = 0;
        odom.twist.covariance[21] = 0;
        odom.twist.covariance[28] = 0;
        odom.twist.covariance[35] = ang_vel_cov;
   
        //Publish the Message
        odom_pub.publish(odom);

        // Update Time Parameter & Sleep
        r.sleep();
        last_time = current_time;
    }
}