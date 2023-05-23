
(cl:in-package :asdf)

(defsystem "devbot_teleop-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CMD" :depends-on ("_package_CMD"))
    (:file "_package_CMD" :depends-on ("_package"))
  ))