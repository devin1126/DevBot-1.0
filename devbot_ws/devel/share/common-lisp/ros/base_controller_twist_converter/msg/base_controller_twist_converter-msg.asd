
(cl:in-package :asdf)

(defsystem "base_controller_twist_converter-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "vel_data" :depends-on ("_package_vel_data"))
    (:file "_package_vel_data" :depends-on ("_package"))
  ))