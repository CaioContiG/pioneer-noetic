#include <iostream>
#include <string.h>
#include <stdio.h>
#include <sstream>
#include <ctime>
#include <cmath>
#include <sys/time.h>

#include "wii_control.h"

#define PI 3.14159265

WiiControl::WiiControl(ros::NodeHandle *nh) : nh_(nh), _sin_angle(0.)
{
    vel_linear = 0.5;
    vel_angular = 0.5; 

    jackal_pub_cmd_vel = nh_->advertise<geometry_msgs::Twist>("cmd_vel_wii", 1);
    //jackal_pub_joy = nh_->advertise<sensor_msgs::Joy>("joy_wii", 1);
    joy_sub_ = nh_->subscribe<sensor_msgs::Joy>("joy", 1, &WiiControl::cmdVelCallback, this);

}

void WiiControl::cmdVelCallback(const sensor_msgs::Joy::ConstPtr &joy_msg)
{
    srand (time(NULL));
    //double var = (((double)rand()/(double)RAND_MAX) * 2 - 1)/10.0f;
    //ROS_INFO_STREAM("velocidade " << vel_linear + var << " | var " << var);
    _sin_angle += PI/10.;
    _sin_angle = std::fmod(_sin_angle, PI);
    double var = std::sin(_sin_angle) / 50.;
    //ROS_INFO_STREAM("velocidade " << vel_linear + var << " | var " << var);

    geometry_msgs::Twist msg_walk;
    if (joy_msg->buttons[8] != 0) {
        msg_walk.linear.x = vel_linear + var;       //Robo vai pra frente
    } else if(joy_msg->buttons[9] != 0) {
        msg_walk.linear.x = -vel_linear + var;      //Robo vai para tras
    } 
    if(joy_msg->buttons[7] != 0) {
        msg_walk.angular.z = -vel_angular + var;    //Robo vira para direita
    } else if(joy_msg->buttons[6] != 0) {
        msg_walk.angular.z = vel_angular + var;     //Robo vira para esquerda
    }
    jackal_pub_cmd_vel.publish(msg_walk);  
}

void WiiControl::digitalJoyCallback(const sensor_msgs::Joy::ConstPtr &joy_msg)
{
    srand (time(NULL));
    _sin_angle += PI/10.;
    _sin_angle = std::fmod(_sin_angle, PI);
    double var = std::sin(_sin_angle) / 50.;

    sensor_msgs::Joy msg_walk;
    msg_walk.buttons[0] = 1;
    if (joy_msg->buttons[8] != 0) {
        msg_walk.axes[0] = vel_linear + var;       //Robo vai pra frente
    } else if(joy_msg->buttons[9] != 0) {
        msg_walk.axes[0] = -vel_linear + var;      //Robo vai para tras
    } else if(joy_msg->buttons[7] != 0) {
        msg_walk.axes[1] = -vel_angular + var;    //Robo vira para direita
    } else if(joy_msg->buttons[6] != 0) {
        msg_walk.axes[1] = vel_angular + var;     //Robo vira para esquerda
    }
    jackal_pub_joy.publish(msg_walk);  
}

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "wii_control");
    ros::NodeHandle nh;
    WiiControl input(&nh);
    ros::spin();
}
