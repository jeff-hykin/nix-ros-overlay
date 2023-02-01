
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, pythonPackages, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-mikrotik-swos-tools";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mikrotik_swos_tools-release";
    rev = "0918810392a97d5ed28fb4a1e4efeed148d942e7";
    owner = "peci1";
    sha256 = "sha256-k/lA5/hor8SxSqtOawHzETppbCvMBEHDLZkAt3+3014=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime pythonPackages.requests rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Integration between ROS (Robot Operating System) and Mikrotik SwOS'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
