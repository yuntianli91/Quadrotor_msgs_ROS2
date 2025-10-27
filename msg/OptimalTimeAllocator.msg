std_msgs/Header header

builtin_interfaces/Time start_time
builtin_interfaces/Time final_time

# the trajectory id, starts from "1".
uint32 trajectory_id

# the action command for trajectory server.
uint32 action_add                      1
uint32 action_abort                    2
uint32 action_warn_start               3
uint32 action_warn_final               4
uint32 action_warn_impossible          5
uint32 action

# the vector of all 'K' number of each piece of the time profile.
int32[] k
int32 k_max

# the a, b, c, d parameters of the TOPP time profile.
float64[] a
float64[] b

# useful variables for evaluating time
float64[] s
float64[] time
float64[] time_acc

# delta_s in s domain
float64 s_step

string debug_info
