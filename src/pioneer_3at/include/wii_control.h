#ifndef WII_CONTROL
#define WII_CONTROL

#include "ros/ros.h"
#include "sensor_msgs/Joy.h"
#include "geometry_msgs/Twist.h"

class WiiControl
{
public:
  explicit WiiControl(ros::NodeHandle *nh);

private:
  void cmdVelCallback(const sensor_msgs::Joy::ConstPtr &joy);
  void digitalJoyCallback(const sensor_msgs::Joy::ConstPtr &joy);

  ros::NodeHandle *nh_;
  ros::Subscriber joy_sub_, odom_cam_sub;
  ros::Publisher camera_pub_, jackal_pub_joy_, jackal_pub_cmd_vel, jackal_pub_joy;

  double vel_linear;
  double vel_angular; 
  double _sin_angle;
};

#endif
