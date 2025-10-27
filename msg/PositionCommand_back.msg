std_msgs/Header header
geometry_msgs/Point position
geometry_msgs/Vector3 velocity
geometry_msgs/Vector3 acceleration
float64 yaw
float64 yaw_dot
float64[3] kx
float64[3] kv 

uint32 trajectory_id

uint8 trajectory_status_empty           0
uint8 trajectory_status_ready           1
uint8 trajectory_status_completed       3
uint8 trajectroy_status_abort           4
uint8 trajectory_status_illegal_start   5
uint8 trajectory_status_illegal_final   6
uint8 trajectory_status_impossible      7

# Its ID number will start from 1, allowing you comparing it with 0.
uint8 trajectory_flag
