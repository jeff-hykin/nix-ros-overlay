
# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, joint-state-publisher, moveit-fake-controller-manager, moveit-kinematics, moveit-planners-ompl, moveit-ros-move-group, moveit-ros-visualization, moveit-setup-assistant, moveit-simple-controller-manager, pincher-arm-description, robot-state-publisher, tf2-ros, xacro }:
buildRosPackage {
  pname = "ros-melodic-pincher-arm-moveit-config";
  version = "0.2.0-r1";

  src = fetchurl {
    url = "https://github.com/fictionlab-gbp/pincher_arm-release/archive/release/melodic/pincher_arm_moveit_config/0.2.0-1.tar.gz";
    name = "0.2.0-1.tar.gz";
    sha256 = "a4d2ce813322d6be8cc38a862407c9999b2539d665799a515071ab95508a0551";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ joint-state-publisher moveit-fake-controller-manager moveit-kinematics moveit-planners-ompl moveit-ros-move-group moveit-ros-visualization moveit-setup-assistant moveit-simple-controller-manager pincher-arm-description robot-state-publisher tf2-ros xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''An automatically generated package with all the configuration and launch files for using the pincher_arm with the MoveIt! Motion Planning Framework'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
