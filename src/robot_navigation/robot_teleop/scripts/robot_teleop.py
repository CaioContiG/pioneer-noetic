#!/usr/bin/env python
# encoding: utf-8

import rospy
from sensor_msgs.msg import JointState, Joy
from geometry_msgs.msg import Twist

rotation = 0.0
linear = 0.0
pub = None
linC = 0.15
rotC = 0.25 

def joyCallback(data):
    global linear, rotation, pub, linC, rotC
    if pub == None:
        return
    
    if (data.buttons[0] and data.buttons[3]):
        linear = (linC + 0.3)*(data.axes[1])
        rotation = (rotC + 0.5)*(data.axes[0])     
    else:
        linear = linC*(data.axes[1])
        rotation = rotC*(data.axes[0])
    vel = Twist()
    vel.linear.x = linear
    vel.angular.z = rotation
    pub.publish(vel)
    #rospy.loginfo("[Robot communication]: Receiving data: %f", data.buttons[1])

def run():
    global rotation, linear, pub
    rospy.init_node('robot_teleop', anonymous=True)
    rospy.loginfo("[Robot communication]: Initiated!")
    # pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
    pub = rospy.Publisher('/rosaria/cmd_vel', Twist, queue_size=1)
    rospy.Subscriber("/joy", Joy, joyCallback)
    
    #rate = rospy.Rate(30) # 30Hz
    #while not rospy.is_shutdown():
    #    vel = Twist()
    #    vel.linear.x = linear
    #    vel.angular.z = rotation
    #    pub.publish(vel)
    #    rate.sleep()
    rospy.spin()

if __name__ == '__main__':
    try:
        run()
    except rospy.ROSInterruptException:
        rospy.loginfo("[Robot communication]: Closed!")
