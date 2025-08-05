# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rviz_streamer: 1 messages, 0 services")

set(MSG_I_FLAGS "-Irviz_streamer:/home/caio/kioneer_ws/src/robot_navigation/rviz_streamer/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rviz_streamer_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/caio/kioneer_ws/src/robot_navigation/rviz_streamer/msg/Mouse.msg" NAME_WE)
add_custom_target(_rviz_streamer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rviz_streamer" "/home/caio/kioneer_ws/src/robot_navigation/rviz_streamer/msg/Mouse.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rviz_streamer
  "/home/caio/kioneer_ws/src/robot_navigation/rviz_streamer/msg/Mouse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rviz_streamer
)

### Generating Services

### Generating Module File
_generate_module_cpp(rviz_streamer
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rviz_streamer
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rviz_streamer_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rviz_streamer_generate_messages rviz_streamer_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/caio/kioneer_ws/src/robot_navigation/rviz_streamer/msg/Mouse.msg" NAME_WE)
add_dependencies(rviz_streamer_generate_messages_cpp _rviz_streamer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rviz_streamer_gencpp)
add_dependencies(rviz_streamer_gencpp rviz_streamer_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rviz_streamer_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(rviz_streamer
  "/home/caio/kioneer_ws/src/robot_navigation/rviz_streamer/msg/Mouse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rviz_streamer
)

### Generating Services

### Generating Module File
_generate_module_eus(rviz_streamer
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rviz_streamer
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(rviz_streamer_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(rviz_streamer_generate_messages rviz_streamer_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/caio/kioneer_ws/src/robot_navigation/rviz_streamer/msg/Mouse.msg" NAME_WE)
add_dependencies(rviz_streamer_generate_messages_eus _rviz_streamer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rviz_streamer_geneus)
add_dependencies(rviz_streamer_geneus rviz_streamer_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rviz_streamer_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rviz_streamer
  "/home/caio/kioneer_ws/src/robot_navigation/rviz_streamer/msg/Mouse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rviz_streamer
)

### Generating Services

### Generating Module File
_generate_module_lisp(rviz_streamer
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rviz_streamer
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rviz_streamer_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rviz_streamer_generate_messages rviz_streamer_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/caio/kioneer_ws/src/robot_navigation/rviz_streamer/msg/Mouse.msg" NAME_WE)
add_dependencies(rviz_streamer_generate_messages_lisp _rviz_streamer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rviz_streamer_genlisp)
add_dependencies(rviz_streamer_genlisp rviz_streamer_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rviz_streamer_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(rviz_streamer
  "/home/caio/kioneer_ws/src/robot_navigation/rviz_streamer/msg/Mouse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rviz_streamer
)

### Generating Services

### Generating Module File
_generate_module_nodejs(rviz_streamer
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rviz_streamer
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(rviz_streamer_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(rviz_streamer_generate_messages rviz_streamer_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/caio/kioneer_ws/src/robot_navigation/rviz_streamer/msg/Mouse.msg" NAME_WE)
add_dependencies(rviz_streamer_generate_messages_nodejs _rviz_streamer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rviz_streamer_gennodejs)
add_dependencies(rviz_streamer_gennodejs rviz_streamer_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rviz_streamer_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rviz_streamer
  "/home/caio/kioneer_ws/src/robot_navigation/rviz_streamer/msg/Mouse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rviz_streamer
)

### Generating Services

### Generating Module File
_generate_module_py(rviz_streamer
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rviz_streamer
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rviz_streamer_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rviz_streamer_generate_messages rviz_streamer_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/caio/kioneer_ws/src/robot_navigation/rviz_streamer/msg/Mouse.msg" NAME_WE)
add_dependencies(rviz_streamer_generate_messages_py _rviz_streamer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rviz_streamer_genpy)
add_dependencies(rviz_streamer_genpy rviz_streamer_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rviz_streamer_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rviz_streamer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rviz_streamer
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(rviz_streamer_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(rviz_streamer_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rviz_streamer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rviz_streamer
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(rviz_streamer_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(rviz_streamer_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rviz_streamer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rviz_streamer
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(rviz_streamer_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(rviz_streamer_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rviz_streamer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rviz_streamer
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(rviz_streamer_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(rviz_streamer_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rviz_streamer)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rviz_streamer\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rviz_streamer
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(rviz_streamer_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(rviz_streamer_generate_messages_py sensor_msgs_generate_messages_py)
endif()
