
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, python3Packages, ros-environment, rosmake, rospack }:
buildRosPackage {
  pname = "ros-noetic-roslib";
  version = "1.15.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros-release";
    rev = "1da93b6b298a3ee55d36653406b334121afc7a96";
    owner = "ros-gbp";
    sha256 = "sha256-ISyKZ9nQph5IURSkqhGrW+TBmjpgvoTPv7B4cVqOImM=";
  };

  buildType = "catkin";
  buildInputs = [ boost python3Packages.setuptools ];
  checkInputs = [ rosmake ];
  propagatedBuildInputs = [ catkin python3Packages.rospkg ros-environment rospack ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''Base dependencies and support libraries for ROS.
    roslib contains many of the common data structures and tools that are shared across ROS client library implementations.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
