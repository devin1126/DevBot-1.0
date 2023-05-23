
(cl:in-package :asdf)

(defsystem "mpu6050_imu_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "mpu6050" :depends-on ("_package_mpu6050"))
    (:file "_package_mpu6050" :depends-on ("_package"))
  ))