
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-cmake-modules";
  version = "0.5.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cmake_modules-release";
    rev = "633207b199bbebd18b5014431a7d77f180e9218b";
    owner = "ros-gbp";
    sha256 = "sha256-5/ipnK3HVqck/Czo+tngnVz3VhQVhDB2XhTfETa1Dgw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A common repository for CMake Modules which are not distributed with CMake but are commonly used by ROS packages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
