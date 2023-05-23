;; Auto-generated. Do not edit!


(when (boundp 'base_controller_twist_converter::vel_data)
  (if (not (find-package "BASE_CONTROLLER_TWIST_CONVERTER"))
    (make-package "BASE_CONTROLLER_TWIST_CONVERTER"))
  (shadow 'vel_data (find-package "BASE_CONTROLLER_TWIST_CONVERTER")))
(unless (find-package "BASE_CONTROLLER_TWIST_CONVERTER::VEL_DATA")
  (make-package "BASE_CONTROLLER_TWIST_CONVERTER::VEL_DATA"))

(in-package "ROS")
;;//! \htmlinclude vel_data.msg.html


(defclass base_controller_twist_converter::vel_data
  :super ros::object
  :slots (_linear_velocity _angular_velocity ))

(defmethod base_controller_twist_converter::vel_data
  (:init
   (&key
    ((:linear_velocity __linear_velocity) 0.0)
    ((:angular_velocity __angular_velocity) 0.0)
    )
   (send-super :init)
   (setq _linear_velocity (float __linear_velocity))
   (setq _angular_velocity (float __angular_velocity))
   self)
  (:linear_velocity
   (&optional __linear_velocity)
   (if __linear_velocity (setq _linear_velocity __linear_velocity)) _linear_velocity)
  (:angular_velocity
   (&optional __angular_velocity)
   (if __angular_velocity (setq _angular_velocity __angular_velocity)) _angular_velocity)
  (:serialization-length
   ()
   (+
    ;; float64 _linear_velocity
    8
    ;; float64 _angular_velocity
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _linear_velocity
       (sys::poke _linear_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angular_velocity
       (sys::poke _angular_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _linear_velocity
     (setq _linear_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angular_velocity
     (setq _angular_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get base_controller_twist_converter::vel_data :md5sum-) "e55b2cec3678035367208627e07de350")
(setf (get base_controller_twist_converter::vel_data :datatype-) "base_controller_twist_converter/vel_data")
(setf (get base_controller_twist_converter::vel_data :definition-)
      "float64 linear_velocity
float64 angular_velocity
")



(provide :base_controller_twist_converter/vel_data "e55b2cec3678035367208627e07de350")


