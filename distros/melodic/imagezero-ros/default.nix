
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, imagezero, message-runtime, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-imagezero-ros";
  version = "0.2.4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "imagezero_transport-release";
    rev = "d06a4e99e745c2f3f11090189493140adc91c767";
    owner = "swri-robotics-gbp";
    sha256 = "sha256-TKcNCttvaRV3hIzu54xUkZV9a/9GQuYIgbosg+YUOwA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roscpp ];
  propagatedBuildInputs = [ cv-bridge imagezero message-runtime sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A library that provides convenient methods for manipulating ROS images with ImageZero'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
