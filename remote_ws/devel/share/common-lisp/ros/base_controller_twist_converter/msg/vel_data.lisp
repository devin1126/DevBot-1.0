; Auto-generated. Do not edit!


(cl:in-package base_controller_twist_converter-msg)


;//! \htmlinclude vel_data.msg.html

(cl:defclass <vel_data> (roslisp-msg-protocol:ros-message)
  ((linear_velocity
    :reader linear_velocity
    :initarg :linear_velocity
    :type cl:float
    :initform 0.0)
   (angular_velocity
    :reader angular_velocity
    :initarg :angular_velocity
    :type cl:float
    :initform 0.0))
)

(cl:defclass vel_data (<vel_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <vel_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'vel_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name base_controller_twist_converter-msg:<vel_data> is deprecated: use base_controller_twist_converter-msg:vel_data instead.")))

(cl:ensure-generic-function 'linear_velocity-val :lambda-list '(m))
(cl:defmethod linear_velocity-val ((m <vel_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader base_controller_twist_converter-msg:linear_velocity-val is deprecated.  Use base_controller_twist_converter-msg:linear_velocity instead.")
  (linear_velocity m))

(cl:ensure-generic-function 'angular_velocity-val :lambda-list '(m))
(cl:defmethod angular_velocity-val ((m <vel_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader base_controller_twist_converter-msg:angular_velocity-val is deprecated.  Use base_controller_twist_converter-msg:angular_velocity instead.")
  (angular_velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <vel_data>) ostream)
  "Serializes a message object of type '<vel_data>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'linear_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angular_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <vel_data>) istream)
  "Deserializes a message object of type '<vel_data>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linear_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular_velocity) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<vel_data>)))
  "Returns string type for a message object of type '<vel_data>"
  "base_controller_twist_converter/vel_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'vel_data)))
  "Returns string type for a message object of type 'vel_data"
  "base_controller_twist_converter/vel_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<vel_data>)))
  "Returns md5sum for a message object of type '<vel_data>"
  "e55b2cec3678035367208627e07de350")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'vel_data)))
  "Returns md5sum for a message object of type 'vel_data"
  "e55b2cec3678035367208627e07de350")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<vel_data>)))
  "Returns full string definition for message of type '<vel_data>"
  (cl:format cl:nil "float64 linear_velocity~%float64 angular_velocity~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'vel_data)))
  "Returns full string definition for message of type 'vel_data"
  (cl:format cl:nil "float64 linear_velocity~%float64 angular_velocity~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <vel_data>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <vel_data>))
  "Converts a ROS message object to a list"
  (cl:list 'vel_data
    (cl:cons ':linear_velocity (linear_velocity msg))
    (cl:cons ':angular_velocity (angular_velocity msg))
))
