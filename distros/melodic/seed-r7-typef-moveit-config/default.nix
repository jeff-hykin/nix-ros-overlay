
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, joint-state-publisher, moveit-fake-controller-manager, moveit-kinematics, moveit-planners-ompl, moveit-ros-move-group, moveit-ros-visualization, moveit-setup-assistant, robot-state-publisher, rviz, seed-r7-description, tf, xacro }:
buildRosPackage {
  pname = "ros-melodic-seed-r7-typef-moveit-config";
  version = "0.3.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "seed_r7_ros_pkg-release";
    rev = "e5045b991526d758022ae139af7f9a9b0a4e8efe";
    owner = "seed-solutions";
    sha256 = "sha256-qZa43l4HjWXzgBFgPwogiIgtZblOgh0tUqOivwlK1LM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ joint-state-publisher moveit-fake-controller-manager moveit-kinematics moveit-planners-ompl moveit-ros-move-group moveit-ros-visualization moveit-setup-assistant robot-state-publisher rviz seed-r7-description tf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''An automatically generated package with all the configuration and launch files for using the SEED-Noid-Mover-typeF with the MoveIt! Motion Planning Framework'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
