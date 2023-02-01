
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, geometry-msgs, message-generation, message-runtime, moveit-msgs, sensor-msgs, shape-msgs }:
buildRosPackage {
  pname = "ros-noetic-grasping-msgs";
  version = "0.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grasping_msgs-gbp";
    rev = "19399b84658be0c0f920805cd9a3d3762d62393d";
    owner = "mikeferguson";
    sha256 = "sha256-6k890ogz0VZKvtTMcT8QQCf3sTND96p4bV7L9WA6AaM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib geometry-msgs message-runtime moveit-msgs sensor-msgs shape-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages for describing objects and how to grasp them.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
