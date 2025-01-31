
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, roscpp, roslint, sensor-msgs, serial }:
buildRosPackage {
  pname = "ros-melodic-um6";
  version = "1.1.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "um6-release";
    rev = "aa170ff62fc4e61acae3d25c64772bedfb6704c2";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-Jq7xl6e/7pAf8wyE+Ykf3vGDB2nDYEyc3Z2zV8tYeBE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation roslint ];
  propagatedBuildInputs = [ message-runtime roscpp sensor-msgs serial ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The um6 package provides a C++ implementation of the CH Robotics serial protocol, and a
    corresponding ROS node for publishing standard ROS orientation topics from a UM6.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
