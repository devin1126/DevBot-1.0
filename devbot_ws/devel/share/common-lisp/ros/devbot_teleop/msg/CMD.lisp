; Auto-generated. Do not edit!


(cl:in-package devbot_teleop-msg)


;//! \htmlinclude CMD.msg.html

(cl:defclass <CMD> (roslisp-msg-protocol:ros-message)
  ((direction
    :reader direction
    :initarg :direction
    :type cl:string
    :initform ""))
)

(cl:defclass CMD (<CMD>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CMD>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CMD)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name devbot_teleop-msg:<CMD> is deprecated: use devbot_teleop-msg:CMD instead.")))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <CMD>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader devbot_teleop-msg:direction-val is deprecated.  Use devbot_teleop-msg:direction instead.")
  (direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CMD>) ostream)
  "Serializes a message object of type '<CMD>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'direction))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CMD>) istream)
  "Deserializes a message object of type '<CMD>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'direction) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CMD>)))
  "Returns string type for a message object of type '<CMD>"
  "devbot_teleop/CMD")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CMD)))
  "Returns string type for a message object of type 'CMD"
  "devbot_teleop/CMD")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CMD>)))
  "Returns md5sum for a message object of type '<CMD>"
  "326e9417def5db9a05a2704a4d8de15e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CMD)))
  "Returns md5sum for a message object of type 'CMD"
  "326e9417def5db9a05a2704a4d8de15e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CMD>)))
  "Returns full string definition for message of type '<CMD>"
  (cl:format cl:nil "string direction~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CMD)))
  "Returns full string definition for message of type 'CMD"
  (cl:format cl:nil "string direction~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CMD>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'direction))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CMD>))
  "Converts a ROS message object to a list"
  (cl:list 'CMD
    (cl:cons ':direction (direction msg))
))
