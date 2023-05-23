# DevBot-1.0
This repository contains all of the code that was used in the creation of the first iteration of my custom ROS-interfaced, surveillance robot coined the 'DevBot'. A presentation that highlights all capabilites of the DevBot can be found in this [presentation](https://youtu.be/uFJXizEifx8). Please read below for details on the code, robot design, and more.

The code used in this project is split into two separate workspaces where 'devbot_ws' contains code that was ran directly on the robot and 'remote_ws' contains code that was ran on the remote computer that the robot was interfacing with. This framework was utilized to reduce the computational load that the robot must endure in order to operate properly. 


## Image of Robot
<img src="https://github.com/devin1126/DevBot-1.0/assets/39745020/983adc2a-390e-4caf-95ed-395055aa90ad" width="400" height="400">

The DevBot 1.0 is equipped with the following:
* Raspberry Pi 4 Model B
* Two Arduino Mega Microcontrollers
* Intel Realsense D435 RGBD Camera Sensor
* LD14 360 deg. LIDAR
* L298N H-Bridge Motor Controller
* Adafruit BNO055 IMU
* IR Wheel Encoders
* 1602 Liquid-Crystal-Display (for debugging purposes only)
---
## Capabilities of Robot
As stated previously, the DevBot is ROS-interfaced to allow for ease of communication between the robot's several subsystems (i.e. motion estimator, occupancy grid generator, path planner, etc.). The specific capabilites of the robot can be listed as:
* Position/Motion Estimation using the Extended Kalman Filter through *ekf_localization_node* in the *robot_localization* package.
* Simultaneous Localization & Mapping (SLAM) through the use of a V-SLAM (visual) algorithm known as Real-Time Appearance-Based Mapping (or RTAB-Map)
* 2D Pose Estimation on an occupancy grid through the use of the Adaptive Monte Carlo Localization (AMCL) algorithm
* Autonomous Navigation through use of the *move_base* node
