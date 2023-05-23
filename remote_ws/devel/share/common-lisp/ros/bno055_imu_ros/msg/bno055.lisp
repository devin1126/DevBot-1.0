; Auto-generated. Do not edit!


(cl:in-package bno055_imu_ros-msg)


;//! \htmlinclude bno055.msg.html

(cl:defclass <bno055> (roslisp-msg-protocol:ros-message)
  ((orientation
    :reader orientation
    :initarg :orientation
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (body_rates
    :reader body_rates
    :initarg :body_rates
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (linear_acceleration
    :reader linear_acceleration
    :initarg :linear_acceleration
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass bno055 (<bno055>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <bno055>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'bno055)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bno055_imu_ros-msg:<bno055> is deprecated: use bno055_imu_ros-msg:bno055 instead.")))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <bno055>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bno055_imu_ros-msg:orientation-val is deprecated.  Use bno055_imu_ros-msg:orientation instead.")
  (orientation m))

(cl:ensure-generic-function 'body_rates-val :lambda-list '(m))
(cl:defmethod body_rates-val ((m <bno055>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bno055_imu_ros-msg:body_rates-val is deprecated.  Use bno055_imu_ros-msg:body_rates instead.")
  (body_rates m))

(cl:ensure-generic-function 'linear_acceleration-val :lambda-list '(m))
(cl:defmethod linear_acceleration-val ((m <bno055>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bno055_imu_ros-msg:linear_acceleration-val is deprecated.  Use bno055_imu_ros-msg:linear_acceleration instead.")
  (linear_acceleration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <bno055>) ostream)
  "Serializes a message object of type '<bno055>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'orientation) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'body_rates) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear_acceleration) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <bno055>) istream)
  "Deserializes a message object of type '<bno055>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'orientation) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'body_rates) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear_acceleration) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<bno055>)))
  "Returns string type for a message object of type '<bno055>"
  "bno055_imu_ros/bno055")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bno055)))
  "Returns string type for a message object of type 'bno055"
  "bno055_imu_ros/bno055")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<bno055>)))
  "Returns md5sum for a message object of type '<bno055>"
  "4a660c7f9d8b57853fe5cf85eb92b12f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'bno055)))
  "Returns md5sum for a message object of type 'bno055"
  "4a660c7f9d8b57853fe5cf85eb92b12f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<bno055>)))
  "Returns full string definition for message of type '<bno055>"
  (cl:format cl:nil "geometry_msgs/Quaternion orientation~%geometry_msgs/Vector3 body_rates~%geometry_msgs/Vector3 linear_acceleration~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'bno055)))
  "Returns full string definition for message of type 'bno055"
  (cl:format cl:nil "geometry_msgs/Quaternion orientation~%geometry_msgs/Vector3 body_rates~%geometry_msgs/Vector3 linear_acceleration~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <bno055>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'orientation))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'body_rates))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear_acceleration))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <bno055>))
  "Converts a ROS message object to a list"
  (cl:list 'bno055
    (cl:cons ':orientation (orientation msg))
    (cl:cons ':body_rates (body_rates msg))
    (cl:cons ':linear_acceleration (linear_acceleration msg))
))
