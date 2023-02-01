
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-roslint";
  version = "0.12.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roslint-release";
    rev = "72fbf79c8ec0a5d8245aefafe1f8f7463b228652";
    owner = "ros-gbp";
    sha256 = "sha256-6zqBH9P++1wWPD9BasHzkFfxxbY8AjYyTMsIkC2F/n0=";
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
