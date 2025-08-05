#!/usr/bin/env python

import rospy
import tf
from geometry_msgs.msg import PoseStamped

def convert_tf_to_pose(tf,frame_id):
    translation,rotation = tf
    pose = PoseStamped()
    pose.header.seq=1
    pose.header.stamp = rospy.Time.now()
    pose.header.frame_id = frame_id

    pose.pose.position.x = translation[0]
    pose.pose.position.y = translation[1]
    pose.pose.position.z = translation[2]

    pose.pose.orientation.x = rotation[0]
    pose.pose.orientation.y = rotation[1]
    pose.pose.orientation.z = rotation[2]
    pose.pose.orientation.w = rotation[3]

    return pose




if __name__=="__main__":
    rospy.init_node("tf_to_pose")
    listener = tf.TransformListener()

    node_name = rospy.get_param("tf_to_pose_topic","")
    frame_id = rospy.get_param("frame_id","map")

    parent_tf = rospy.get_param("parent_tf","map")
    child_tf = rospy.get_param("child_tf","odom")

    pose_pub = rospy.Publisher("{name}/pose".format(name=node_name),PoseStamped,queue_size=10)
    while not rospy.is_shutdown():
        try:
            tf = listener.lookupTransform(parent_tf,child_tf,rospy.Time(0))
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            continue

        pose = convert_tf_to_pose(tf,frame_id)
        pose_pub.publish(pose)