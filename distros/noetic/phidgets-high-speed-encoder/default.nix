
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nodelet, phidgets-api, phidgets-msgs, pluginlib, roscpp, roslaunch, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-phidgets-high-speed-encoder";
  version = "1.0.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "phidgets_drivers-release";
    rev = "829753a2d69df080a8637f7692257d4c8eab36a9";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-s7CL7CQG+Y51iwdWo1n8rdh0J2vGBgvVqmEee9c8e1M=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ nodelet phidgets-api phidgets-msgs pluginlib roscpp roslaunch sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Driver for the Phidgets high speed encoder devices'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
