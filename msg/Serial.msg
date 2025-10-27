# Note: These constants need to be kept in sync with the types
# defined in include/quadrotor_msgs/comm_types.h
uint8 so3_cmd   115 # 's' in base 10
uint8 trpy_cmd   112 # 'p' in base 10
uint8 status_data   99 # 'c' in base 10
uint8 output_data   100 # 'd' in base 10
uint8 ppr_output_data   116 # 't' in base 10
uint8 ppr_gains   103 # 'g'

std_msgs/Header header
uint8 channel
uint8 type # One of the types listed above
uint8[] data
