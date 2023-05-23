;; Auto-generated. Do not edit!


(when (boundp 'mpu6050_imu_ros::mpu6050)
  (if (not (find-package "MPU6050_IMU_ROS"))
    (make-package "MPU6050_IMU_ROS"))
  (shadow 'mpu6050 (find-package "MPU6050_IMU_ROS")))
(unless (find-package "MPU6050_IMU_ROS::MPU6050")
  (make-package "MPU6050_IMU_ROS::MPU6050"))

(in-package "ROS")
;;//! \htmlinclude mpu6050.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass mpu6050_imu_ros::mpu6050
  :super ros::object
  :slots (_orientation _body_rates ))

(defmethod mpu6050_imu_ros::mpu6050
  (:init
   (&key
    ((:orientation __orientation) (instance geometry_msgs::Quaternion :init))
    ((:body_rates __body_rates) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _orientation __orientation)
   (setq _body_rates __body_rates)
   self)
  (:orientation
   (&rest __orientation)
   (if (keywordp (car __orientation))
       (send* _orientation __orientation)
     (progn
       (if __orientation (setq _orientation (car __orientation)))
       _orientation)))
  (:body_rates
   (&rest __body_rates)
   (if (keywordp (car __body_rates))
       (send* _body_rates __body_rates)
     (progn
       (if __body_rates (setq _body_rates (car __body_rates)))
       _body_rates)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Quaternion _orientation
    (send _orientation :serialization-length)
    ;; geometry_msgs/Vector3 _body_rates
    (send _body_rates :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Quaternion _orientation
       (send _orientation :serialize s)
     ;; geometry_msgs/Vector3 _body_rates
       (send _body_rates :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Quaternion _orientation
     (send _orientation :deserialize buf ptr-) (incf ptr- (send _orientation :serialization-length))
   ;; geometry_msgs/Vector3 _body_rates
     (send _body_rates :deserialize buf ptr-) (incf ptr- (send _body_rates :serialization-length))
   ;;
   self)
  )

(setf (get mpu6050_imu_ros::mpu6050 :md5sum-) "d84bad830e0ca58f7358ace8e2e9beef")
(setf (get mpu6050_imu_ros::mpu6050 :datatype-) "mpu6050_imu_ros/mpu6050")
(setf (get mpu6050_imu_ros::mpu6050 :definition-)
      "geometry_msgs/Quaternion orientation
geometry_msgs/Vector3 body_rates
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :mpu6050_imu_ros/mpu6050 "d84bad830e0ca58f7358ace8e2e9beef")


