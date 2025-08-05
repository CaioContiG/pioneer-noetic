cmake_minimum_required(VERSION 2.8.3)
project(pioneer_3at)

find_package(catkin REQUIRED COMPONENTS
  cv_bridge
  roscpp
  rospy
  std_msgs
  tf
  sensor_msgs
  geometry_msgs
)

find_package(OpenCV REQUIRED)

catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS cv_bridge image_transport roscpp rospy std_msgs sensor_msgs geometry_msgs
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_definitions(-std=c++11)

# Wii Control
add_executable(wii_control src/wii_control.cpp)
target_link_libraries(wii_control ${catkin_LIBRARIES})

