# the action command for trajectory server.
uint32 action_add               1
uint32 action_abort             2
uint32 action_warn_start        3
uint32 action_warn_final        4
uint32 action_warn_impossible   5
uint32 action

int32 order
int64 traj_id
float64[] knots
geometry_msgs/Point[] pts
builtin_interfaces/Time start_time
float64 time_extra
float64 replan_to_global_time
