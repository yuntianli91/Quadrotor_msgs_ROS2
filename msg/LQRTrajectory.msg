std_msgs/Header header

# the trajectory id, starts from "1".
uint32 trajectory_id

# the action command for trajectory server.
uint32 action_add               1
uint32 action_abort             2
uint32 action_warn_start        3
uint32 action_warn_final        4
uint32 action_warn_impossible   5
uint32 action

# the weight coefficient of the control effort
float64 r

# the yaw command
float64 start_yaw
float64 final_yaw

# the initial and final state
float64[6] s0
float64[3] ut
 
float64[6] sf 

# the optimal arrival time
float64 t_f

string debug_info
