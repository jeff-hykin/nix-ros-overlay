
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, franka-description, joint-state-publisher, joint-state-publisher-gui, moveit-fake-controller-manager, moveit-kinematics, moveit-planners-ompl, moveit-ros-move-group, moveit-ros-visualization, moveit-setup-assistant, moveit-simple-controller-manager, robot-state-publisher, rviz, tf2-ros, xacro }:
buildRosPackage {
  pname = "ros-noetic-panda-moveit-config";
  version = "0.8.1-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "ros-gbp";
        repo = "panda_moveit_config-release";
        rev = "release/noetic/panda_moveit_config/0.8.1-1";
        sha256 = "sha256-Zhn27VOU3XmerMh3Y1+QfsloEnBnyHZFOo+hmgNS1+8=";
      };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ franka-description joint-state-publisher joint-state-publisher-gui moveit-fake-controller-manager moveit-kinematics moveit-planners-ompl moveit-ros-move-group moveit-ros-visualization moveit-setup-assistant moveit-simple-controller-manager robot-state-publisher rviz tf2-ros xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''An automatically generated package with all the configuration and launch files for using the panda with the MoveIt Motion Planning Framework'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
