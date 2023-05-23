
(cl:in-package :asdf)

(defsystem "devbot_navigation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "wheel_info" :depends-on ("_package_wheel_info"))
    (:file "_package_wheel_info" :depends-on ("_package"))
  ))