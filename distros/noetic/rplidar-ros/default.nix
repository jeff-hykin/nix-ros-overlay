
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosconsole, roscpp, sensor-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-noetic-rplidar-ros";
  version = "2.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rplidar_ros-release";
    rev = "477f3d4438f7ee97902fc4371e59d68de2a67850";
    owner = "nobleo";
    sha256 = "sha256-a9HQiQEE89UEN9uTuCEif9tix6S7xgbaYS7rx/k7ssw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rosconsole roscpp sensor-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rplidar ros package, support rplidar A2/A1 and A3/S1'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
