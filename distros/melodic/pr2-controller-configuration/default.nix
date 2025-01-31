
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pr2-controller-manager, pr2-gripper-action, pr2-head-action, pr2-machine, robot-mechanism-controllers, roslaunch, single-joint-position-action }:
buildRosPackage {
  pname = "ros-melodic-pr2-controller-configuration";
  version = "1.6.31-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_robot-release";
    rev = "584c954adebf4ec1a53c0cd3dde32025b640cdc4";
    owner = "pr2-gbp";
    sha256 = "sha256-2U/NhA/Kp8sqY9C0TPVg7hUQhSN2yK9mjHq82tDQfFQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslaunch ];
  propagatedBuildInputs = [ pr2-controller-manager pr2-gripper-action pr2-head-action pr2-machine robot-mechanism-controllers single-joint-position-action ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Configuration files for PR2 controllers.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
