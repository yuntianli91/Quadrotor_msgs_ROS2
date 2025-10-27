uint8 status_odom_valid       0
uint8 status_odom_invalid     1
uint8 status_odom_loopclosure 2

nav_msgs/Odometry cur_odom
nav_msgs/Odometry kf_odom
uint32 kf_id
uint8 status
