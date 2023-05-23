;; Auto-generated. Do not edit!


(when (boundp 'devbot_navigation::wheel_info)
  (if (not (find-package "DEVBOT_NAVIGATION"))
    (make-package "DEVBOT_NAVIGATION"))
  (shadow 'wheel_info (find-package "DEVBOT_NAVIGATION")))
(unless (find-package "DEVBOT_NAVIGATION::WHEEL_INFO")
  (make-package "DEVBOT_NAVIGATION::WHEEL_INFO"))

(in-package "ROS")
;;//! \htmlinclude wheel_info.msg.html


(defclass devbot_navigation::wheel_info
  :super ros::object
  :slots (_wheel_volt_R _wheel_volt_L _wheel_cmd_R _wheel_cmd_L _wheel_vel_R _wheel_vel_L ))

(defmethod devbot_navigation::wheel_info
  (:init
   (&key
    ((:wheel_volt_R __wheel_volt_R) 0)
    ((:wheel_volt_L __wheel_volt_L) 0)
    ((:wheel_cmd_R __wheel_cmd_R) 0.0)
    ((:wheel_cmd_L __wheel_cmd_L) 0.0)
    ((:wheel_vel_R __wheel_vel_R) 0.0)
    ((:wheel_vel_L __wheel_vel_L) 0.0)
    )
   (send-super :init)
   (setq _wheel_volt_R (round __wheel_volt_R))
   (setq _wheel_volt_L (round __wheel_volt_L))
   (setq _wheel_cmd_R (float __wheel_cmd_R))
   (setq _wheel_cmd_L (float __wheel_cmd_L))
   (setq _wheel_vel_R (float __wheel_vel_R))
   (setq _wheel_vel_L (float __wheel_vel_L))
   self)
  (:wheel_volt_R
   (&optional __wheel_volt_R)
   (if __wheel_volt_R (setq _wheel_volt_R __wheel_volt_R)) _wheel_volt_R)
  (:wheel_volt_L
   (&optional __wheel_volt_L)
   (if __wheel_volt_L (setq _wheel_volt_L __wheel_volt_L)) _wheel_volt_L)
  (:wheel_cmd_R
   (&optional __wheel_cmd_R)
   (if __wheel_cmd_R (setq _wheel_cmd_R __wheel_cmd_R)) _wheel_cmd_R)
  (:wheel_cmd_L
   (&optional __wheel_cmd_L)
   (if __wheel_cmd_L (setq _wheel_cmd_L __wheel_cmd_L)) _wheel_cmd_L)
  (:wheel_vel_R
   (&optional __wheel_vel_R)
   (if __wheel_vel_R (setq _wheel_vel_R __wheel_vel_R)) _wheel_vel_R)
  (:wheel_vel_L
   (&optional __wheel_vel_L)
   (if __wheel_vel_L (setq _wheel_vel_L __wheel_vel_L)) _wheel_vel_L)
  (:serialization-length
   ()
   (+
    ;; int64 _wheel_volt_R
    8
    ;; int64 _wheel_volt_L
    8
    ;; float64 _wheel_cmd_R
    8
    ;; float64 _wheel_cmd_L
    8
    ;; float64 _wheel_vel_R
    8
    ;; float64 _wheel_vel_L
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _wheel_volt_R
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _wheel_volt_R (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _wheel_volt_R) (= (length (_wheel_volt_R . bv)) 2)) ;; bignum
              (write-long (ash (elt (_wheel_volt_R . bv) 0) 0) s)
              (write-long (ash (elt (_wheel_volt_R . bv) 1) -1) s))
             ((and (class _wheel_volt_R) (= (length (_wheel_volt_R . bv)) 1)) ;; big1
              (write-long (elt (_wheel_volt_R . bv) 0) s)
              (write-long (if (>= _wheel_volt_R 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _wheel_volt_R s)(write-long (if (>= _wheel_volt_R 0) 0 #xffffffff) s)))
     ;; int64 _wheel_volt_L
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _wheel_volt_L (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _wheel_volt_L) (= (length (_wheel_volt_L . bv)) 2)) ;; bignum
              (write-long (ash (elt (_wheel_volt_L . bv) 0) 0) s)
              (write-long (ash (elt (_wheel_volt_L . bv) 1) -1) s))
             ((and (class _wheel_volt_L) (= (length (_wheel_volt_L . bv)) 1)) ;; big1
              (write-long (elt (_wheel_volt_L . bv) 0) s)
              (write-long (if (>= _wheel_volt_L 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _wheel_volt_L s)(write-long (if (>= _wheel_volt_L 0) 0 #xffffffff) s)))
     ;; float64 _wheel_cmd_R
       (sys::poke _wheel_cmd_R (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_cmd_L
       (sys::poke _wheel_cmd_L (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_vel_R
       (sys::poke _wheel_vel_R (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheel_vel_L
       (sys::poke _wheel_vel_L (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _wheel_volt_R
#+(or :alpha :irix6 :x86_64)
      (setf _wheel_volt_R (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _wheel_volt_R (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _wheel_volt_L
#+(or :alpha :irix6 :x86_64)
      (setf _wheel_volt_L (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _wheel_volt_L (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _wheel_cmd_R
     (setq _wheel_cmd_R (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_cmd_L
     (setq _wheel_cmd_L (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_vel_R
     (setq _wheel_vel_R (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheel_vel_L
     (setq _wheel_vel_L (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get devbot_navigation::wheel_info :md5sum-) "da1f1150c07550c7f87dd0a67c7a0fac")
(setf (get devbot_navigation::wheel_info :datatype-) "devbot_navigation/wheel_info")
(setf (get devbot_navigation::wheel_info :definition-)
      "int64 wheel_volt_R
int64 wheel_volt_L
float64 wheel_cmd_R
float64 wheel_cmd_L
float64 wheel_vel_R
float64 wheel_vel_L
")



(provide :devbot_navigation/wheel_info "da1f1150c07550c7f87dd0a67c7a0fac")


