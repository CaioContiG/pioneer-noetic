
(cl:in-package :asdf)

(defsystem "rviz_streamer-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Mouse" :depends-on ("_package_Mouse"))
    (:file "_package_Mouse" :depends-on ("_package"))
  ))