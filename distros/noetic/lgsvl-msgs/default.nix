
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, geometry-msgs, message-generation, message-runtime, ros-environment, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-lgsvl-msgs";
  version = "0.0.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "lgsvl_msgs-release";
    rev = "9fe3a58c36abf1e42ed3cf8395c52fa6a57ff0e0";
    owner = "lgsvl";
    sha256 = "sha256-Pd5TP0wLuUr0/m+WvLpkvURpB0d0hbik3SOPkifg8YU=";
  };

  buildType = "catkin";
  buildInputs = [ message-generation ros-environment ];
  propagatedBuildInputs = [ geometry-msgs message-runtime sensor-msgs std-msgs ];

  meta = {
    description = ''Message definitions for interfacing with the LGSVL Simulator for ROS and ROS 2.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
