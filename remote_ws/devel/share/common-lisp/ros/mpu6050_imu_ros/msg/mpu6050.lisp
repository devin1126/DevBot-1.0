; Auto-generated. Do not edit!


(cl:in-package mpu6050_imu_ros-msg)


;//! \htmlinclude mpu6050.msg.html

(cl:defclass <mpu6050> (roslisp-msg-protocol:ros-message)
  ((orientation
    :reader orientation
    :initarg :orientation
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (body_rates
    :reader body_rates
    :initarg :body_rates
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass mpu6050 (<mpu6050>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mpu6050>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mpu6050)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mpu6050_imu_ros-msg:<mpu6050> is deprecated: use mpu6050_imu_ros-msg:mpu6050 instead.")))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <mpu6050>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpu6050_imu_ros-msg:orientation-val is deprecated.  Use mpu6050_imu_ros-msg:orientation instead.")
  (orientation m))

(cl:ensure-generic-function 'body_rates-val :lambda-list '(m))
(cl:defmethod body_rates-val ((m <mpu6050>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpu6050_imu_ros-msg:body_rates-val is deprecated.  Use mpu6050_imu_ros-msg:body_rates instead.")
  (body_rates m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mpu6050>) ostream)
  "Serializes a message object of type '<mpu6050>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'orientation) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'body_rates) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mpu6050>) istream)
  "Deserializes a message object of type '<mpu6050>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'orientation) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'body_rates) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mpu6050>)))
  "Returns string type for a message object of type '<mpu6050>"
  "mpu6050_imu_ros/mpu6050")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mpu6050)))
  "Returns string type for a message object of type 'mpu6050"
  "mpu6050_imu_ros/mpu6050")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mpu6050>)))
  "Returns md5sum for a message object of type '<mpu6050>"
  "d84bad830e0ca58f7358ace8e2e9beef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mpu6050)))
  "Returns md5sum for a message object of type 'mpu6050"
  "d84bad830e0ca58f7358ace8e2e9beef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mpu6050>)))
  "Returns full string definition for message of type '<mpu6050>"
  (cl:format cl:nil "geometry_msgs/Quaternion orientation~%geometry_msgs/Vector3 body_rates~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mpu6050)))
  "Returns full string definition for message of type 'mpu6050"
  (cl:format cl:nil "geometry_msgs/Quaternion orientation~%geometry_msgs/Vector3 body_rates~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mpu6050>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'orientation))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'body_rates))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mpu6050>))
  "Converts a ROS message object to a list"
  (cl:list 'mpu6050
    (cl:cons ':orientation (orientation msg))
    (cl:cons ':body_rates (body_rates msg))
))
