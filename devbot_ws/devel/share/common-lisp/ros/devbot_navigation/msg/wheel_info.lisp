; Auto-generated. Do not edit!


(cl:in-package devbot_navigation-msg)


;//! \htmlinclude wheel_info.msg.html

(cl:defclass <wheel_info> (roslisp-msg-protocol:ros-message)
  ((wheel_volt_R
    :reader wheel_volt_R
    :initarg :wheel_volt_R
    :type cl:integer
    :initform 0)
   (wheel_volt_L
    :reader wheel_volt_L
    :initarg :wheel_volt_L
    :type cl:integer
    :initform 0)
   (wheel_cmd_R
    :reader wheel_cmd_R
    :initarg :wheel_cmd_R
    :type cl:float
    :initform 0.0)
   (wheel_cmd_L
    :reader wheel_cmd_L
    :initarg :wheel_cmd_L
    :type cl:float
    :initform 0.0)
   (wheel_vel_R
    :reader wheel_vel_R
    :initarg :wheel_vel_R
    :type cl:float
    :initform 0.0)
   (wheel_vel_L
    :reader wheel_vel_L
    :initarg :wheel_vel_L
    :type cl:float
    :initform 0.0))
)

(cl:defclass wheel_info (<wheel_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <wheel_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'wheel_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name devbot_navigation-msg:<wheel_info> is deprecated: use devbot_navigation-msg:wheel_info instead.")))

(cl:ensure-generic-function 'wheel_volt_R-val :lambda-list '(m))
(cl:defmethod wheel_volt_R-val ((m <wheel_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader devbot_navigation-msg:wheel_volt_R-val is deprecated.  Use devbot_navigation-msg:wheel_volt_R instead.")
  (wheel_volt_R m))

(cl:ensure-generic-function 'wheel_volt_L-val :lambda-list '(m))
(cl:defmethod wheel_volt_L-val ((m <wheel_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader devbot_navigation-msg:wheel_volt_L-val is deprecated.  Use devbot_navigation-msg:wheel_volt_L instead.")
  (wheel_volt_L m))

(cl:ensure-generic-function 'wheel_cmd_R-val :lambda-list '(m))
(cl:defmethod wheel_cmd_R-val ((m <wheel_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader devbot_navigation-msg:wheel_cmd_R-val is deprecated.  Use devbot_navigation-msg:wheel_cmd_R instead.")
  (wheel_cmd_R m))

(cl:ensure-generic-function 'wheel_cmd_L-val :lambda-list '(m))
(cl:defmethod wheel_cmd_L-val ((m <wheel_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader devbot_navigation-msg:wheel_cmd_L-val is deprecated.  Use devbot_navigation-msg:wheel_cmd_L instead.")
  (wheel_cmd_L m))

(cl:ensure-generic-function 'wheel_vel_R-val :lambda-list '(m))
(cl:defmethod wheel_vel_R-val ((m <wheel_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader devbot_navigation-msg:wheel_vel_R-val is deprecated.  Use devbot_navigation-msg:wheel_vel_R instead.")
  (wheel_vel_R m))

(cl:ensure-generic-function 'wheel_vel_L-val :lambda-list '(m))
(cl:defmethod wheel_vel_L-val ((m <wheel_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader devbot_navigation-msg:wheel_vel_L-val is deprecated.  Use devbot_navigation-msg:wheel_vel_L instead.")
  (wheel_vel_L m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <wheel_info>) ostream)
  "Serializes a message object of type '<wheel_info>"
  (cl:let* ((signed (cl:slot-value msg 'wheel_volt_R)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'wheel_volt_L)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wheel_cmd_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wheel_cmd_L))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wheel_vel_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wheel_vel_L))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <wheel_info>) istream)
  "Deserializes a message object of type '<wheel_info>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wheel_volt_R) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wheel_volt_L) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheel_cmd_R) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheel_cmd_L) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheel_vel_R) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheel_vel_L) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<wheel_info>)))
  "Returns string type for a message object of type '<wheel_info>"
  "devbot_navigation/wheel_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'wheel_info)))
  "Returns string type for a message object of type 'wheel_info"
  "devbot_navigation/wheel_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<wheel_info>)))
  "Returns md5sum for a message object of type '<wheel_info>"
  "da1f1150c07550c7f87dd0a67c7a0fac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'wheel_info)))
  "Returns md5sum for a message object of type 'wheel_info"
  "da1f1150c07550c7f87dd0a67c7a0fac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<wheel_info>)))
  "Returns full string definition for message of type '<wheel_info>"
  (cl:format cl:nil "int64 wheel_volt_R~%int64 wheel_volt_L~%float64 wheel_cmd_R~%float64 wheel_cmd_L~%float64 wheel_vel_R~%float64 wheel_vel_L~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'wheel_info)))
  "Returns full string definition for message of type 'wheel_info"
  (cl:format cl:nil "int64 wheel_volt_R~%int64 wheel_volt_L~%float64 wheel_cmd_R~%float64 wheel_cmd_L~%float64 wheel_vel_R~%float64 wheel_vel_L~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <wheel_info>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <wheel_info>))
  "Converts a ROS message object to a list"
  (cl:list 'wheel_info
    (cl:cons ':wheel_volt_R (wheel_volt_R msg))
    (cl:cons ':wheel_volt_L (wheel_volt_L msg))
    (cl:cons ':wheel_cmd_R (wheel_cmd_R msg))
    (cl:cons ':wheel_cmd_L (wheel_cmd_L msg))
    (cl:cons ':wheel_vel_R (wheel_vel_R msg))
    (cl:cons ':wheel_vel_L (wheel_vel_L msg))
))
