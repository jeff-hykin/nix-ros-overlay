
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-msgs, diagnostic-updater, log4cxx, message-generation, message-runtime, pr2-msgs, roscpp, rospy }:
buildRosPackage {
  pname = "ros-melodic-pr2-power-board";
  version = "1.1.7";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_power_drivers-release";
    rev = "7b7b81c59c2c958044a1bd84fbc977f6ade89977";
    owner = "pr2-gbp";
    sha256 = "sha256-LlxzWccusj0MllE3PH9TxALq76gEqiOy9ggcd3bqN0g=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater log4cxx message-runtime pr2-msgs roscpp rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This provides a ROS node for the PR2 Power Board.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
