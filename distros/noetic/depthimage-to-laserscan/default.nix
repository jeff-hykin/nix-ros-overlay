
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, gtest, image-geometry, image-transport, nodelet, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-depthimage-to-laserscan";
  version = "1.0.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "depthimage_to_laserscan-release";
    rev = "844f2f797a7c6b0002ce564f7ecbc1fe4d743ddc";
    owner = "ros-gbp";
    sha256 = "sha256-zklPnFlu3CesAV/Nn4VBxDh6s1nsRgshyE9r46A2ZA0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin gtest ];
  propagatedBuildInputs = [ dynamic-reconfigure image-geometry image-transport nodelet roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''depthimage_to_laserscan'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
