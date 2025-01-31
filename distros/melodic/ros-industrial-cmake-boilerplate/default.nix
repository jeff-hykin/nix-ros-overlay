
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, clang, cmake, cppcheck, gtest, include-what-you-use, lcov }:
buildRosPackage {
  pname = "ros-melodic-ros-industrial-cmake-boilerplate";
  version = "0.2.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_industrial_cmake_boilerplate-release";
    rev = "eae8ef0ca6a60850e97dcaa7cfdea876c96d21c5";
    owner = "ros-industrial-release";
    sha256 = "sha256-rTJLeyQ5OOI2Coj1bz1/087xo5l9J//K0UQDWsoMFRg=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  checkInputs = [ clang cppcheck gtest include-what-you-use lcov ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Contains boilerplate cmake script, macros and utils'';
    license = with lib.licenses; [ asl20 bsd3 ];
  };
}
