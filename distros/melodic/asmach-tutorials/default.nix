
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, asmach, catkin, message-generation, rospy, smach-ros, turtlesim }:
buildRosPackage {
  pname = "ros-melodic-asmach-tutorials";
  version = "1.0.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "linux_networking-release";
    rev = "f03d78be871e3205659af0300d31693aeef3258f";
    owner = "pr2-gbp";
    sha256 = "sha256-bnUU2cISKX229nx7qN1XY6rqxszIbDgNjNRiBfLDSZY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib actionlib-msgs asmach rospy smach-ros turtlesim ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package containes numerous examples of how to use SMACH. See the examples directory.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
