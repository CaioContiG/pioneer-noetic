;; Auto-generated. Do not edit!


(when (boundp 'robot_info::Info)
  (if (not (find-package "ROBOT_INFO"))
    (make-package "ROBOT_INFO"))
  (shadow 'Info (find-package "ROBOT_INFO")))
(unless (find-package "ROBOT_INFO::INFO")
  (make-package "ROBOT_INFO::INFO"))

(in-package "ROS")
;;//! \htmlinclude Info.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robot_info::Info
  :super ros::object
  :slots (_header _voltage _orientation _velocity _motor_status _sonar_status _arm_torque _arm_status _cam360_status _second_cam_status _map_status _ptz_camera ))

(defmethod robot_info::Info
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:voltage __voltage) 0.0)
    ((:orientation __orientation) 0.0)
    ((:velocity __velocity) 0.0)
    ((:motor_status __motor_status) 0)
    ((:sonar_status __sonar_status) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:arm_torque __arm_torque) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:arm_status __arm_status) 0)
    ((:cam360_status __cam360_status) 0)
    ((:second_cam_status __second_cam_status) 0)
    ((:map_status __map_status) 0)
    ((:ptz_camera __ptz_camera) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _voltage (float __voltage))
   (setq _orientation (float __orientation))
   (setq _velocity (float __velocity))
   (setq _motor_status (round __motor_status))
   (setq _sonar_status __sonar_status)
   (setq _arm_torque __arm_torque)
   (setq _arm_status (round __arm_status))
   (setq _cam360_status (round __cam360_status))
   (setq _second_cam_status (round __second_cam_status))
   (setq _map_status (round __map_status))
   (setq _ptz_camera (round __ptz_camera))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:voltage
   (&optional __voltage)
   (if __voltage (setq _voltage __voltage)) _voltage)
  (:orientation
   (&optional __orientation)
   (if __orientation (setq _orientation __orientation)) _orientation)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:motor_status
   (&optional __motor_status)
   (if __motor_status (setq _motor_status __motor_status)) _motor_status)
  (:sonar_status
   (&optional __sonar_status)
   (if __sonar_status (setq _sonar_status __sonar_status)) _sonar_status)
  (:arm_torque
   (&optional __arm_torque)
   (if __arm_torque (setq _arm_torque __arm_torque)) _arm_torque)
  (:arm_status
   (&optional __arm_status)
   (if __arm_status (setq _arm_status __arm_status)) _arm_status)
  (:cam360_status
   (&optional __cam360_status)
   (if __cam360_status (setq _cam360_status __cam360_status)) _cam360_status)
  (:second_cam_status
   (&optional __second_cam_status)
   (if __second_cam_status (setq _second_cam_status __second_cam_status)) _second_cam_status)
  (:map_status
   (&optional __map_status)
   (if __map_status (setq _map_status __map_status)) _map_status)
  (:ptz_camera
   (&optional __ptz_camera)
   (if __ptz_camera (setq _ptz_camera __ptz_camera)) _ptz_camera)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _voltage
    4
    ;; float64 _orientation
    8
    ;; float64 _velocity
    8
    ;; int32 _motor_status
    4
    ;; float64[] _sonar_status
    (* 8    (length _sonar_status)) 4
    ;; float64[] _arm_torque
    (* 8    (length _arm_torque)) 4
    ;; int32 _arm_status
    4
    ;; int32 _cam360_status
    4
    ;; int32 _second_cam_status
    4
    ;; int32 _map_status
    4
    ;; int32 _ptz_camera
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _voltage
       (sys::poke _voltage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64 _orientation
       (sys::poke _orientation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _motor_status
       (write-long _motor_status s)
     ;; float64[] _sonar_status
     (write-long (length _sonar_status) s)
     (dotimes (i (length _sonar_status))
       (sys::poke (elt _sonar_status i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _arm_torque
     (write-long (length _arm_torque) s)
     (dotimes (i (length _arm_torque))
       (sys::poke (elt _arm_torque i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; int32 _arm_status
       (write-long _arm_status s)
     ;; int32 _cam360_status
       (write-long _cam360_status s)
     ;; int32 _second_cam_status
       (write-long _second_cam_status s)
     ;; int32 _map_status
       (write-long _map_status s)
     ;; int32 _ptz_camera
       (write-long _ptz_camera s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _voltage
     (setq _voltage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64 _orientation
     (setq _orientation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _motor_status
     (setq _motor_status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64[] _sonar_status
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sonar_status (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sonar_status i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _arm_torque
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _arm_torque (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _arm_torque i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; int32 _arm_status
     (setq _arm_status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _cam360_status
     (setq _cam360_status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _second_cam_status
     (setq _second_cam_status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _map_status
     (setq _map_status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _ptz_camera
     (setq _ptz_camera (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_info::Info :md5sum-) "9e754eb821b149031ec48f77a9ecbbc4")
(setf (get robot_info::Info :datatype-) "robot_info/Info")
(setf (get robot_info::Info :definition-)
      "Header header
float32 voltage
float64 orientation
float64 velocity
int32 motor_status
float64[] sonar_status
float64[] arm_torque
int32 arm_status
int32 cam360_status
int32 second_cam_status
int32 map_status
int32 ptz_camera
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



(provide :robot_info/Info "9e754eb821b149031ec48f77a9ecbbc4")


