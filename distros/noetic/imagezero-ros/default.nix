
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, imagezero, message-runtime, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-imagezero-ros";
  version = "0.2.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "imagezero_transport-release";
    rev = "22a7520f94e47fba1c557fef920e11048203fb2f";
    owner = "swri-robotics-gbp";
    sha256 = "sha256-paL6aYGMKaqbwT0XFygQRPTzp4Fs/po2kcZVTF3rXY4=";
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
