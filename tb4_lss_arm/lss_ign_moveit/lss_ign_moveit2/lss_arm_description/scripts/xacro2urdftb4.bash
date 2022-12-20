#!/usr/bin/env bash
# This script converts xacro (URDF variant) into URDF for `lss_arm_description` package

SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" &>/dev/null && pwd)"
XACRO_PATH="$(dirname "${SCRIPT_DIR}")/urdf/tb4_lss_arm.urdf.xacro"
URDF_PATH="$(dirname "${SCRIPT_DIR}")/urdf/tb4_lss_arm.urdf"

# Arguments for xacro
XACRO_ARGS=(
    name:=tb4_lss_arm
    tb4:=true
    gripper:=true
    collision_arm:=true
    collision_gripper:=true
    ros2_control:=true
    ros2_control_plugin:=ign
    ros2_control_command_interface:=effort
    gazebo_preserve_fixed_joint:=false
)

# Remove old URDF file
rm "${URDF_PATH}" 2>/dev/null

# Process xacro into URDF
xacro "${XACRO_PATH}" "${XACRO_ARGS[@]}" -o "${URDF_PATH}" &&
echo "Created new ${URDF_PATH}"
