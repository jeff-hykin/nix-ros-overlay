
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, joint-state-publisher, joy, moveit-fake-controller-manager, moveit-kinematics, moveit-planners-ompl, moveit-ros-move-group, moveit-ros-visualization, moveit-ros-warehouse, moveit-simple-controller-manager, robot-state-publisher, roslaunch, rostest, rviz, tra1-description, warehouse-ros, xacro }:
buildRosPackage {
  pname = "ros-melodic-tra1-moveit-config";
  version = "1.0.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "minas-release";
    rev = "267d7d8e4d12f8781333087b614dcee5c3dfa5f5";
    owner = "tork-a";
    sha256 = "sha256-MtrQqMdCgAW5NxedmSGXIq4eOg9RGYpcqzlhjPKebAI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ joint-state-publisher joy moveit-fake-controller-manager moveit-kinematics moveit-planners-ompl moveit-ros-move-group moveit-ros-visualization moveit-ros-warehouse moveit-simple-controller-manager robot-state-publisher rviz tra1-description warehouse-ros xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''An automatically generated package with all the configuration and launch files for using the tra1 with the MoveIt! Motion Planning Framework'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
