
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages }:
buildRosPackage {
  pname = "ros-noetic-rosgraph";
  version = "1.15.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_comm-release";
    rev = "acc57bf52025a173166fa113b14c2d4d8d4940c0";
    owner = "ros-gbp";
    sha256 = "sha256-jq4MIInm8uKGXWZ2FiIpc/LXoZFB5giV5YemnFBNE1I=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ python3Packages.mock ];
  propagatedBuildInputs = [ python3Packages.netifaces python3Packages.pyyaml python3Packages.rospkg ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rosgraph contains the rosgraph command-line tool, which prints
    information about the ROS Computation Graph. It also provides an
    internal library that can be used by graphical tools.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
