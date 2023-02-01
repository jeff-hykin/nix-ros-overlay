
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-cmake-modules";
  version = "0.4.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cmake_modules-release";
    rev = "9a9a244d605cf8ecb85fbd80efaa7defdf0641ad";
    owner = "ros-gbp";
    sha256 = "sha256-kV48QZeY9ecmSIWtlA5sHrphaXsywZ+/fN25VMAXcIY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A common repository for CMake Modules which are not distributed with CMake but are commonly used by ROS packages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
