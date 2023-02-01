
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-roslint";
  version = "0.11.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roslint-release";
    rev = "f9ddef819849e46a2c46f3660309d9d98e9c1df8";
    owner = "ros-gbp";
    sha256 = "sha256-I0deHAP9G8QEyxmE0FUNVuOzNw2ieRZVAKiD5fYO8O8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''CMake lint commands for ROS packages.

    The lint commands perform static checking of Python or C++ source
    code for errors and standards compliance.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
