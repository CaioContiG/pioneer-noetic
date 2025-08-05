#!/usr/bin/env python
# encoding: utf-8
import rospy
import tf
from p2os_msgs.msg import BatteryState
from nav_msgs.msg import Odometry
from p2os_msgs.msg import MotorState
from p2os_msgs.msg import SonarArray
from dynamixel_msgs.msg import JointState

from robot_info.msg import Info
import rosnode


class RobotInfo(object):
    def __init__(self):
        rospy.init_node("robot_info", anonymous=False)
        #rospy.init_node("screen_streamer", anonymous=False, log_level=rospy.DEBUG)
        self.info_msg = Info()
        self.info_msg.arm_torque = [0]*3
        self.info_msg.sonar_status = [0]*16

        self.image_publisher = rospy.Publisher("/robot_info", Info, queue_size=1)

        rospy.Subscriber("/pose", Odometry, self.odomCallback)
        rospy.Subscriber("/battery_state", BatteryState, self.batteryCallback)
        rospy.Subscriber("/motor_state", MotorState, self.motorCallback)
        rospy.Subscriber("/sonar", SonarArray, self.sonarCallback)
        rospy.Subscriber("/elbow_flex_joint/state", JointState, self.elbowCallback)
        rospy.Subscriber("/shoulder_pitch_joint/state", JointState, self.shoulderPitchCallback)
        rospy.Subscriber("/shovel_joint/state", JointState, self.shovelCallback)

        self.rate = rospy.Rate(1) # 20 seconds for limiting data traffic
    
    def elbowCallback(self, data):
        self.info_msg.arm_torque[1] = abs(data.load)

    def shoulderPitchCallback(self, data):
        self.info_msg.arm_torque[0] = abs(data.load)

    def shovelCallback(self, data):
        self.info_msg.arm_torque[2] = abs(data.load)

    def sonarCallback(self, msg):
        self.info_msg.sonar_status = msg.ranges # get the 16 sonars sensors on robot

    def batteryCallback(self, msg):
        self.info_msg.voltage = msg.voltage # battery signal

    def motorCallback(self, msg):
        self.info_msg.motor_status = msg.state # motor is on or off

    def odomCallback(self, msg):
        quaternion = (
            msg.pose.pose.orientation.x,
            msg.pose.pose.orientation.y,
            msg.pose.pose.orientation.z,
            msg.pose.pose.orientation.w)
        euler = tf.transformations.euler_from_quaternion(quaternion)
        yaw = euler[2]
        self.info_msg.orientation = yaw # yaw orietnation
        self.info_msg.velocity = msg.twist.twist.linear.x # linear velocity in x

    def run(self):
        rospy.loginfo("\33[95m Running...\33[0m")
        while not rospy.is_shutdown():

            try:
                if '/ricoh_capture' in rosnode.get_node_names():
                    self.info_msg.cam360_status = int(rosnode.rosnode_ping('ricoh_capture', max_count=1))
                else:
                    self.info_msg.cam360_status = 0

                if '/rvision' in rosnode.get_node_names():
                    self.info_msg.ptz_camera = int(rosnode.rosnode_ping('/rvision', max_count=1))
                else:
                    self.info_msg.ptz_camera = 0

                if '/camera/realsense2_camera' in rosnode.get_node_names():
                    self.info_msg.second_cam_status = int(rosnode.rosnode_ping('camera/realsense2_camera', max_count=1))
                else:
                    self.info_msg.second_cam_status = 0

                if '/arm_action_controller' in rosnode.get_node_names():
                    self.info_msg.arm_status = int(rosnode.rosnode_ping('arm_action_controller', max_count=1))
                else:
                    self.info_msg.arm_status = 0

                if '/rviz_streamer' in rosnode.get_node_names():
                    self.info_msg.map_status = int(rosnode.rosnode_ping('rviz_streamer', max_count=1))
                else:
                    self.info_msg.map_status = 0
                    

                self.image_publisher.publish(self.info_msg)
                rospy.loginfo(self.info_msg)
            except:
                rospy.logwarn("Can't send this information")
            self.rate.sleep()


# Main function
if __name__ == '__main__':
    try:
        info = RobotInfo()
        info.run()
    except rospy.ROSInterruptException:
        rospy.logerr("[Robot Info Exception]: Closed!")