cmake_minimum_required(VERSION 3.8)
project(quadrotor_msgs)

# Default to C++17
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# Find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(nav_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(std_msgs REQUIRED)
find_package(builtin_interfaces REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(Eigen3 REQUIRED)

# Include directories
include_directories(
  include
  ${EIGEN3_INCLUDE_DIRS}
)

# Declare the list of messages
set(msg_files
  "msg/AuxCommand.msg"
  "msg/Corrections.msg"
  "msg/Gains.msg"
  "msg/GoalSet.msg"
  "msg/OutputData.msg"
  "msg/PositionCommand.msg"
  "msg/PPROutputData.msg"
  "msg/Serial.msg"
  "msg/SO3Command.msg"
  "msg/StatusData.msg"
  "msg/TRPYCommand.msg"
  "msg/Odometry.msg"
  "msg/PolynomialTrajectory.msg"
  "msg/OptimalTimeAllocator.msg"
  "msg/TrajectoryMatrix.msg"
  "msg/ReplanCheck.msg"
  "msg/SpatialTemporalTrajectory.msg"
  "msg/Bspline.msg"
  "msg/SwarmCommand.msg"
  "msg/Replan.msg"
  "msg/SwarmOdometry.msg"
  "msg/SwarmInfo.msg"
  "msg/Px4ctrlDebug.msg"
  "msg/TakeoffLand.msg"
)

# Generate messages
rosidl_generate_interfaces(${PROJECT_NAME}
  ${msg_files}
  DEPENDENCIES 
    std_msgs
    geometry_msgs 
    nav_msgs
    builtin_interfaces
)

# Create libraries
add_library(decode_msgs SHARED src/decode_msgs.cpp)

add_library(encode_msgs SHARED src/encode_msgs.cpp)

# Add dependencies for the libraries to ensure messages are generated first
rosidl_get_typesupport_target(cpp_typesupport_target
${PROJECT_NAME} "rosidl_typesupport_cpp"
)

target_link_libraries(decode_msgs
"${cpp_typesupport_target}"
Eigen3::Eigen
)

target_link_libraries(encode_msgs
"${cpp_typesupport_target}"
Eigen3::Eigen
)

# Specify dependencies
ament_target_dependencies(decode_msgs
rclcpp
geometry_msgs
nav_msgs
)

ament_target_dependencies(encode_msgs
rclcpp
geometry_msgs
nav_msgs
)

# Export libraries
ament_export_targets(export_${PROJECT_NAME} HAS_LIBRARY_TARGET)
ament_export_dependencies(
rclcpp
geometry_msgs
nav_msgs
rosidl_default_runtime
Eigen3
)

# Install libraries
install(
TARGETS decode_msgs encode_msgs
EXPORT export_${PROJECT_NAME}
LIBRARY DESTINATION lib
ARCHIVE DESTINATION lib
RUNTIME DESTINATION bin
INCLUDES DESTINATION include
)

# Install header files
install(
DIRECTORY include/
DESTINATION include
)

# Export information
ament_export_include_directories(include)
ament_export_libraries(decode_msgs encode_msgs)

ament_package()
