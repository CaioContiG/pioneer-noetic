#!/usr/bin/env python

import rospy
from sensor_msgs.msg import JointState, Joy
from geometry_msgs.msg import Twist

rotation = 0.0
linear = 0.0
pub = None

def jointsCallback(data):
    global rotation
    #rotation = data.position[0]
    #rospy.loginfo("[Robot communication]: Receiving data!")
    pass

def joyCallback(data):
    global linear, rotation, pub
    if pub == None:
        return
    linear = 0.1*(data.axes[1])
    rotation = 0.2*(data.axes[0])
    boost = 5*data.buttons[7]
    if boost != 0:
        linear *= boost
        rotation *= boost
    vel = Twist()
    vel.linear.x = linear
    vel.angular.z = rotation
    pub.publish(vel)
    
    rospy.loginfo("[Robot communication]: Receiving data: %f", data.buttons[1])

def run():
    global rotation, linear, pub
    rospy.init_node('robot_teleop', anonymous=True)
    rospy.loginfo("[Robot communication]: Initiated!")
    rospy.Subscriber("/geomagic/joint", JointState, jointsCallback)
    pub = rospy.Publisher('/rosaria/cmd_vel', Twist, queue_size=1)
    rospy.Subscriber("/joy", Joy, joyCallback)
    
    rate = rospy.Rate(30) # 30Hz
    while not rospy.is_shutdown():
       vel = Twist()
       vel.linear.x = linear
       vel.angular.z = rotation
       pub.publish(vel)
       rate.sleep()
    # rospy.spin()

if __name__ == '__main__':
    try:
        run()
    except rospy.ROSInterruptException:
        rospy.loginfo("[Robot communication]: Closed!")
