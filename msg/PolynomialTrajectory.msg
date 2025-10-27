std_msgs/Header header

# the trajectory id, starts from "1".
uint32 trajectory_id

# the action command for trajectory server.
uint32 action_add                      1
uint32 action_abort                    2
uint32 action_warn_start               3
uint32 action_warn_final               4
uint32 action_warn_impossible          5
uint32 action

# the order of trajectory.
uint32 num_order
uint32 num_segment

# the polynomial coecfficients of the trajectory.
float64 start_yaw
float64 final_yaw
float64[] coef_x
float64[] coef_y
float64[] coef_z
float64[] time
float64 mag_coeff
uint32[] order

string debug_info
