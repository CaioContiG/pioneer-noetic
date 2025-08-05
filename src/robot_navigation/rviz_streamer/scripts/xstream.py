#!/usr/bin/env python
# encoding: utf-8
import Xlib
from Xlib import display, X, ext
from Xlib.protocol import event
from PIL import Image as PILImage
import numpy as np
import rospy
import cv2
import time
from cv_bridge.core import CvBridge
from sensor_msgs.msg import Image
from rviz_streamer.msg import Mouse

class ScreenStreamer(object):
    def __init__(self):
        rospy.init_node("screen_streamer", anonymous=False)
        #rospy.init_node("screen_streamer", anonymous=False, log_level=rospy.DEBUG)
        self.last_msg = Mouse()
        self.last_msg.buttons = [0,0,0,0,0]
        self.image_publisher = rospy.Publisher(
            "/ss/image", Image, queue_size=1)
        rospy.Subscriber("/mouse", Mouse, self.mouseCallback)
        self.win_name = rospy.get_param('~window_name', "RViz")
        rospy.logdebug("Window name " + str(self.win_name))
        self.rotation = rospy.get_param('~rotation', 0)
        rospy.logdebug("Window rotation " + str(self.rotation))
        self.frate = rospy.get_param('~rate', 30)
        rospy.logdebug("Window frame rate " + str(self.frate))
        self.rate = rospy.Rate(self.frate)
        self.display = display.Display()
        self.root = self.display.screen().root
        self.window = None
        rospy.logdebug("Searching for windows " + self.win_name)
        self.searchWin(self.root)
        

    def searchWin(self, window):
        # Search for the named window in the window tree of the system
        children = window.query_tree().children
        for w in children:
            name = window.get_wm_name()
            if name != None and self.win_name in name and self.window == None:
                self.window = window
                rospy.logdebug(str(self.window))
                rospy.logdebug(str(name))
                rospy.logdebug(str(window.get_attributes()))
                rospy.logdebug(str(window.get_geometry()))
                return
            self.searchWin(w)

    def mouseCallback(self, msg):
        # receive mouse data from unity and convert it into xlib events to rviz
        for i in range(len(msg.buttons)):
            if msg.buttons[i] == self.last_msg.buttons[i] and (msg.x == self.last_msg.x) and (msg.y == self.last_msg.y):
                continue
            if msg.buttons[i] == 1:
                e1 = event.ButtonPress(
                    time=int(time.time()),
                    root=self.root,
                    window=self.window,
                    same_screen=0, child=X.NONE,
                    root_x=msg.x, root_y=msg.y, event_x=msg.x, event_y=msg.y,
                    state=0,
                    detail=i+1
                )
            else:
                e1 = event.ButtonRelease(
                    time=int(time.time()),
                    root=self.root,
                    window=self.window,
                    same_screen=0, child=X.NONE,
                    root_x=msg.x, root_y=msg.y, event_x=msg.x, event_y=msg.y,
                    state=0,
                    detail=i+1
                )
            print e1
            self.window.send_event(e1, propagate=True)
            rospy.logdebug(str(msg))
        self.last_msg = msg
        

    def stream(self):
        # capture the screen of the windom, convert it to ros image and publish it
        name = self.window.get_wm_name()
        transient_for = self.window.get_wm_transient_for()
        attrs = self.window.get_attributes()
        if attrs.map_state != X.IsViewable:
            rospy.logerr("[ERROR] Can't stream this window! Window is not viewable.")
            return

        while not rospy.is_shutdown():
            try:
                self.W = self.window.get_geometry().width
                self.H = self.window.get_geometry().height
                raw = self.window.get_image(0, 0, self.W, self.H, X.ZPixmap, 0xffffffff)
                image = PILImage.frombuffer(
                    "RGB", (self.W, self.H), raw.data, "raw", "BGRX")
                image = image.rotate(self.rotation)
                image = image.resize((1280, 720))
                image_msg = CvBridge().cv2_to_imgmsg(np.asarray(image), "rgb8")
                self.image_publisher.publish(image_msg)
            except:
                rospy.logwarn("Can't capture this frame. Windows size ("+ str(self.W) + ", " + str(self.H) + ")")
            self.rate.sleep()


# Main function
if __name__ == '__main__':
    try:
        ss = ScreenStreamer()
        ss.stream()
    except rospy.ROSInterruptException:
        rospy.logerr("[ScreenStreamer Exception]: Closed!")
