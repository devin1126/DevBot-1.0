
(cl:in-package :asdf)

(defsystem "bno055_imu_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "bno055" :depends-on ("_package_bno055"))
    (:file "_package_bno055" :depends-on ("_package"))
  ))