
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-ros, libphidget22 }:
buildRosPackage {
  pname = "ros-rolling-phidgets-api";
  version = "2.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "phidgets_drivers-release";
    rev = "76e90e2dc28acbccb0ae1137955e5c7a97e8b3d9";
    owner = "ros2-gbp";
    sha256 = "sha256-9pXa6lWke+ucR8zTxpZjlQfMeJWONZYZUvmjBQIqLZM=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ libphidget22 ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''A C++ Wrapper for the Phidgets C API'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
