;; Auto-generated. Do not edit!


(when (boundp 'bno055_imu_ros::bno055)
  (if (not (find-package "BNO055_IMU_ROS"))
    (make-package "BNO055_IMU_ROS"))
  (shadow 'bno055 (find-package "BNO055_IMU_ROS")))
(unless (find-package "BNO055_IMU_ROS::BNO055")
  (make-package "BNO055_IMU_ROS::BNO055"))

(in-package "ROS")
;;//! \htmlinclude bno055.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass bno055_imu_ros::bno055
  :super ros::object
  :slots (_orientation _body_rates _linear_acceleration ))

(defmethod bno055_imu_ros::bno055
  (:init
   (&key
    ((:orientation __orientation) (instance geometry_msgs::Quaternion :init))
    ((:body_rates __body_rates) (instance geometry_msgs::Vector3 :init))
    ((:linear_acceleration __linear_acceleration) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _orientation __orientation)
   (setq _body_rates __body_rates)
   (setq _linear_acceleration __linear_acceleration)
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
  (:linear_acceleration
   (&rest __linear_acceleration)
   (if (keywordp (car __linear_acceleration))
       (send* _linear_acceleration __linear_acceleration)
     (progn
       (if __linear_acceleration (setq _linear_acceleration (car __linear_acceleration)))
       _linear_acceleration)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Quaternion _orientation
    (send _orientation :serialization-length)
    ;; geometry_msgs/Vector3 _body_rates
    (send _body_rates :serialization-length)
    ;; geometry_msgs/Vector3 _linear_acceleration
    (send _linear_acceleration :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Quaternion _orientation
       (send _orientation :serialize s)
     ;; geometry_msgs/Vector3 _body_rates
       (send _body_rates :serialize s)
     ;; geometry_msgs/Vector3 _linear_acceleration
       (send _linear_acceleration :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Quaternion _orientation
     (send _orientation :deserialize buf ptr-) (incf ptr- (send _orientation :serialization-length))
   ;; geometry_msgs/Vector3 _body_rates
     (send _body_rates :deserialize buf ptr-) (incf ptr- (send _body_rates :serialization-length))
   ;; geometry_msgs/Vector3 _linear_acceleration
     (send _linear_acceleration :deserialize buf ptr-) (incf ptr- (send _linear_acceleration :serialization-length))
   ;;
   self)
  )

(setf (get bno055_imu_ros::bno055 :md5sum-) "4a660c7f9d8b57853fe5cf85eb92b12f")
(setf (get bno055_imu_ros::bno055 :datatype-) "bno055_imu_ros/bno055")
(setf (get bno055_imu_ros::bno055 :definition-)
      "geometry_msgs/Quaternion orientation
geometry_msgs/Vector3 body_rates
geometry_msgs/Vector3 linear_acceleration
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



(provide :bno055_imu_ros/bno055 "4a660c7f9d8b57853fe5cf85eb92b12f")


