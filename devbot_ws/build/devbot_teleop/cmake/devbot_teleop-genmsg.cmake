# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "devbot_teleop: 1 messages, 0 services")

set(MSG_I_FLAGS "-Idevbot_teleop:/home/devin1126/devbot_ws/src/devbot_teleop/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(devbot_teleop_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/devin1126/devbot_ws/src/devbot_teleop/msg/CMD.msg" NAME_WE)
add_custom_target(_devbot_teleop_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "devbot_teleop" "/home/devin1126/devbot_ws/src/devbot_teleop/msg/CMD.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(devbot_teleop
  "/home/devin1126/devbot_ws/src/devbot_teleop/msg/CMD.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/devbot_teleop
)

### Generating Services

### Generating Module File
_generate_module_cpp(devbot_teleop
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/devbot_teleop
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(devbot_teleop_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(devbot_teleop_generate_messages devbot_teleop_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/devin1126/devbot_ws/src/devbot_teleop/msg/CMD.msg" NAME_WE)
add_dependencies(devbot_teleop_generate_messages_cpp _devbot_teleop_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(devbot_teleop_gencpp)
add_dependencies(devbot_teleop_gencpp devbot_teleop_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS devbot_teleop_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(devbot_teleop
  "/home/devin1126/devbot_ws/src/devbot_teleop/msg/CMD.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/devbot_teleop
)

### Generating Services

### Generating Module File
_generate_module_eus(devbot_teleop
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/devbot_teleop
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(devbot_teleop_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(devbot_teleop_generate_messages devbot_teleop_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/devin1126/devbot_ws/src/devbot_teleop/msg/CMD.msg" NAME_WE)
add_dependencies(devbot_teleop_generate_messages_eus _devbot_teleop_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(devbot_teleop_geneus)
add_dependencies(devbot_teleop_geneus devbot_teleop_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS devbot_teleop_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(devbot_teleop
  "/home/devin1126/devbot_ws/src/devbot_teleop/msg/CMD.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/devbot_teleop
)

### Generating Services

### Generating Module File
_generate_module_lisp(devbot_teleop
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/devbot_teleop
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(devbot_teleop_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(devbot_teleop_generate_messages devbot_teleop_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/devin1126/devbot_ws/src/devbot_teleop/msg/CMD.msg" NAME_WE)
add_dependencies(devbot_teleop_generate_messages_lisp _devbot_teleop_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(devbot_teleop_genlisp)
add_dependencies(devbot_teleop_genlisp devbot_teleop_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS devbot_teleop_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(devbot_teleop
  "/home/devin1126/devbot_ws/src/devbot_teleop/msg/CMD.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/devbot_teleop
)

### Generating Services

### Generating Module File
_generate_module_nodejs(devbot_teleop
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/devbot_teleop
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(devbot_teleop_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(devbot_teleop_generate_messages devbot_teleop_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/devin1126/devbot_ws/src/devbot_teleop/msg/CMD.msg" NAME_WE)
add_dependencies(devbot_teleop_generate_messages_nodejs _devbot_teleop_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(devbot_teleop_gennodejs)
add_dependencies(devbot_teleop_gennodejs devbot_teleop_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS devbot_teleop_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(devbot_teleop
  "/home/devin1126/devbot_ws/src/devbot_teleop/msg/CMD.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/devbot_teleop
)

### Generating Services

### Generating Module File
_generate_module_py(devbot_teleop
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/devbot_teleop
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(devbot_teleop_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(devbot_teleop_generate_messages devbot_teleop_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/devin1126/devbot_ws/src/devbot_teleop/msg/CMD.msg" NAME_WE)
add_dependencies(devbot_teleop_generate_messages_py _devbot_teleop_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(devbot_teleop_genpy)
add_dependencies(devbot_teleop_genpy devbot_teleop_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS devbot_teleop_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/devbot_teleop)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/devbot_teleop
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(devbot_teleop_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/devbot_teleop)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/devbot_teleop
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(devbot_teleop_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/devbot_teleop)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/devbot_teleop
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(devbot_teleop_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/devbot_teleop)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/devbot_teleop
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(devbot_teleop_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/devbot_teleop)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/devbot_teleop\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/devbot_teleop
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(devbot_teleop_generate_messages_py std_msgs_generate_messages_py)
endif()
