# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "base_controller_twist_converter: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ibase_controller_twist_converter:/home/devin1126/devbot_ws/src/base_controller_twist_converter/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(base_controller_twist_converter_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/devin1126/devbot_ws/src/base_controller_twist_converter/msg/vel_data.msg" NAME_WE)
add_custom_target(_base_controller_twist_converter_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "base_controller_twist_converter" "/home/devin1126/devbot_ws/src/base_controller_twist_converter/msg/vel_data.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(base_controller_twist_converter
  "/home/devin1126/devbot_ws/src/base_controller_twist_converter/msg/vel_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/base_controller_twist_converter
)

### Generating Services

### Generating Module File
_generate_module_cpp(base_controller_twist_converter
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/base_controller_twist_converter
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(base_controller_twist_converter_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(base_controller_twist_converter_generate_messages base_controller_twist_converter_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/devin1126/devbot_ws/src/base_controller_twist_converter/msg/vel_data.msg" NAME_WE)
add_dependencies(base_controller_twist_converter_generate_messages_cpp _base_controller_twist_converter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(base_controller_twist_converter_gencpp)
add_dependencies(base_controller_twist_converter_gencpp base_controller_twist_converter_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS base_controller_twist_converter_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(base_controller_twist_converter
  "/home/devin1126/devbot_ws/src/base_controller_twist_converter/msg/vel_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/base_controller_twist_converter
)

### Generating Services

### Generating Module File
_generate_module_eus(base_controller_twist_converter
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/base_controller_twist_converter
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(base_controller_twist_converter_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(base_controller_twist_converter_generate_messages base_controller_twist_converter_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/devin1126/devbot_ws/src/base_controller_twist_converter/msg/vel_data.msg" NAME_WE)
add_dependencies(base_controller_twist_converter_generate_messages_eus _base_controller_twist_converter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(base_controller_twist_converter_geneus)
add_dependencies(base_controller_twist_converter_geneus base_controller_twist_converter_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS base_controller_twist_converter_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(base_controller_twist_converter
  "/home/devin1126/devbot_ws/src/base_controller_twist_converter/msg/vel_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/base_controller_twist_converter
)

### Generating Services

### Generating Module File
_generate_module_lisp(base_controller_twist_converter
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/base_controller_twist_converter
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(base_controller_twist_converter_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(base_controller_twist_converter_generate_messages base_controller_twist_converter_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/devin1126/devbot_ws/src/base_controller_twist_converter/msg/vel_data.msg" NAME_WE)
add_dependencies(base_controller_twist_converter_generate_messages_lisp _base_controller_twist_converter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(base_controller_twist_converter_genlisp)
add_dependencies(base_controller_twist_converter_genlisp base_controller_twist_converter_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS base_controller_twist_converter_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(base_controller_twist_converter
  "/home/devin1126/devbot_ws/src/base_controller_twist_converter/msg/vel_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/base_controller_twist_converter
)

### Generating Services

### Generating Module File
_generate_module_nodejs(base_controller_twist_converter
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/base_controller_twist_converter
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(base_controller_twist_converter_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(base_controller_twist_converter_generate_messages base_controller_twist_converter_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/devin1126/devbot_ws/src/base_controller_twist_converter/msg/vel_data.msg" NAME_WE)
add_dependencies(base_controller_twist_converter_generate_messages_nodejs _base_controller_twist_converter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(base_controller_twist_converter_gennodejs)
add_dependencies(base_controller_twist_converter_gennodejs base_controller_twist_converter_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS base_controller_twist_converter_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(base_controller_twist_converter
  "/home/devin1126/devbot_ws/src/base_controller_twist_converter/msg/vel_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/base_controller_twist_converter
)

### Generating Services

### Generating Module File
_generate_module_py(base_controller_twist_converter
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/base_controller_twist_converter
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(base_controller_twist_converter_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(base_controller_twist_converter_generate_messages base_controller_twist_converter_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/devin1126/devbot_ws/src/base_controller_twist_converter/msg/vel_data.msg" NAME_WE)
add_dependencies(base_controller_twist_converter_generate_messages_py _base_controller_twist_converter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(base_controller_twist_converter_genpy)
add_dependencies(base_controller_twist_converter_genpy base_controller_twist_converter_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS base_controller_twist_converter_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/base_controller_twist_converter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/base_controller_twist_converter
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/base_controller_twist_converter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/base_controller_twist_converter
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/base_controller_twist_converter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/base_controller_twist_converter
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/base_controller_twist_converter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/base_controller_twist_converter
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/base_controller_twist_converter)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/base_controller_twist_converter\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/base_controller_twist_converter
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
