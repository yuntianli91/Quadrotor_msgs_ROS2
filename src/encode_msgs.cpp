#include "quadrotor_msgs/encode_msgs.h"
#include <quadrotor_msgs/comm_types.h>

namespace quadrotor_msgs
{

void encodeSO3Command(const quadrotor_msgs::msg::SO3Command &so3_command,
                      std::vector<uint8_t> &output)
{
  struct SO3_CMD_INPUT so3_cmd_input;

  so3_cmd_input.force[0] = so3_command.force.x*500;
  so3_cmd_input.force[1] = so3_command.force.y*500;
  so3_cmd_input.force[2] = so3_command.force.z*500;

  so3_cmd_input.des_qx = so3_command.orientation.x*125;
  so3_cmd_input.des_qy = so3_command.orientation.y*125;
  so3_cmd_input.des_qz = so3_command.orientation.z*125;
  so3_cmd_input.des_qw = so3_command.orientation.w*125;

  so3_cmd_input.k_r[0] = so3_command.k_r[0]*50;
  so3_cmd_input.k_r[1] = so3_command.k_r[1]*50;
  so3_cmd_input.k_r[2] = so3_command.k_r[2]*50;

  so3_cmd_input.k_om[0] = so3_command.k_om[0]*100;
  so3_cmd_input.k_om[1] = so3_command.k_om[1]*100;
  so3_cmd_input.k_om[2] = so3_command.k_om[2]*100;

  so3_cmd_input.cur_yaw = so3_command.aux.current_yaw*1e4;

  so3_cmd_input.kf_correction = so3_command.aux.kf_correction*1e11;
  so3_cmd_input.angle_corrections[0] = so3_command.aux.angle_corrections[0]*2500;
  so3_cmd_input.angle_corrections[1] = so3_command.aux.angle_corrections[1]*2500;

  so3_cmd_input.enable_motors = so3_command.aux.enable_motors;
  so3_cmd_input.use_external_yaw = so3_command.aux.use_external_yaw;

  // so3_cmd_input.seq = so3_command.header.seq % 255; seq not used anymore in ros2.

  output.resize(sizeof(so3_cmd_input));
  memcpy(&output[0], &so3_cmd_input, sizeof(so3_cmd_input));
}

void encodeTRPYCommand(const quadrotor_msgs::msg::TRPYCommand &trpy_command,
                        std::vector<uint8_t> &output)
{
  struct TRPY_CMD trpy_cmd_input;
  trpy_cmd_input.thrust = trpy_command.thrust*1e4;
  trpy_cmd_input.roll = trpy_command.roll*1e4;
  trpy_cmd_input.pitch = trpy_command.pitch*1e4;
  trpy_cmd_input.yaw = trpy_command.yaw*1e4;
  trpy_cmd_input.current_yaw = trpy_command.aux.current_yaw*1e4;
  trpy_cmd_input.enable_motors = trpy_command.aux.enable_motors;
  trpy_cmd_input.use_external_yaw = trpy_command.aux.use_external_yaw;

  output.resize(sizeof(trpy_cmd_input));
  memcpy(&output[0], &trpy_cmd_input, sizeof(trpy_cmd_input));
}

void encodePPRGains(const quadrotor_msgs::msg::Gains &gains,
                    std::vector<uint8_t> &output)
{
  struct PPR_GAINS ppr_gains;
  ppr_gains.kp = gains.kp;
  ppr_gains.kd = gains.kd;
  ppr_gains.kp_yaw = gains.kp_yaw;
  ppr_gains.kd_yaw = gains.kd_yaw;

  output.resize(sizeof(ppr_gains));
  memcpy(&output[0], &ppr_gains, sizeof(ppr_gains));
}

}
