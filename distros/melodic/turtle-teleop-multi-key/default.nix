
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, rospy }:
buildRosPackage {
  pname = "ros-melodic-turtle-teleop-multi-key";
  version = "0.0.4-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtle_teleop_multi_key-release";
    rev = "275d415778a377f910cdc60ffbc67f5adf18d30d";
    owner = "EngHyu";
    sha256 = "sha256-fsA78UrGVwMnzuIjwBTa38XgNoRAw3HrNV9SJnoFyFA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Provides teleoperation using multi-key input for Turtlesim/Turtlebot3.'';
    license = with lib.licenses; [ mit ];
  };
}
