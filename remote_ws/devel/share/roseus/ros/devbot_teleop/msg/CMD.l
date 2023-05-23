;; Auto-generated. Do not edit!


(when (boundp 'devbot_teleop::CMD)
  (if (not (find-package "DEVBOT_TELEOP"))
    (make-package "DEVBOT_TELEOP"))
  (shadow 'CMD (find-package "DEVBOT_TELEOP")))
(unless (find-package "DEVBOT_TELEOP::CMD")
  (make-package "DEVBOT_TELEOP::CMD"))

(in-package "ROS")
;;//! \htmlinclude CMD.msg.html


(defclass devbot_teleop::CMD
  :super ros::object
  :slots (_direction ))

(defmethod devbot_teleop::CMD
  (:init
   (&key
    ((:direction __direction) "")
    )
   (send-super :init)
   (setq _direction (string __direction))
   self)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:serialization-length
   ()
   (+
    ;; string _direction
    4 (length _direction)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _direction
       (write-long (length _direction) s) (princ _direction s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get devbot_teleop::CMD :md5sum-) "326e9417def5db9a05a2704a4d8de15e")
(setf (get devbot_teleop::CMD :datatype-) "devbot_teleop/CMD")
(setf (get devbot_teleop::CMD :definition-)
      "string direction
")



(provide :devbot_teleop/CMD "326e9417def5db9a05a2704a4d8de15e")


