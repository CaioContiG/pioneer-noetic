;; Auto-generated. Do not edit!


(when (boundp 'rviz_streamer::Mouse)
  (if (not (find-package "RVIZ_STREAMER"))
    (make-package "RVIZ_STREAMER"))
  (shadow 'Mouse (find-package "RVIZ_STREAMER")))
(unless (find-package "RVIZ_STREAMER::MOUSE")
  (make-package "RVIZ_STREAMER::MOUSE"))

(in-package "ROS")
;;//! \htmlinclude Mouse.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass rviz_streamer::Mouse
  :super ros::object
  :slots (_header _x _y _buttons ))

(defmethod rviz_streamer::Mouse
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:x __x) 0)
    ((:y __y) 0)
    ((:buttons __buttons) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _header __header)
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _buttons __buttons)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:buttons
   (&optional __buttons)
   (if __buttons (setq _buttons __buttons)) _buttons)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _x
    4
    ;; uint32 _y
    4
    ;; int32[] _buttons
    (* 4    (length _buttons)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _x
       (write-long _x s)
     ;; uint32 _y
       (write-long _y s)
     ;; int32[] _buttons
     (write-long (length _buttons) s)
     (dotimes (i (length _buttons))
       (write-long (elt _buttons i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _x
     (setq _x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _y
     (setq _y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _buttons
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _buttons (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _buttons i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get rviz_streamer::Mouse :md5sum-) "172513ca8a49df1d02eb2a66cecb8b4f")
(setf (get rviz_streamer::Mouse :datatype-) "rviz_streamer/Mouse")
(setf (get rviz_streamer::Mouse :definition-)
      "Header header
uint32 x
uint32 y
int32[] buttons
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :rviz_streamer/Mouse "172513ca8a49df1d02eb2a66cecb8b4f")


