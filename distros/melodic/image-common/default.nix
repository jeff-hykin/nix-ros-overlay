
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-calibration-parsers, camera-info-manager, catkin, image-transport, polled-camera }:
buildRosPackage {
  pname = "ros-melodic-image-common";
  version = "1.11.13";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "image_common-release";
    rev = "80fed29e9277708b8ff8e88d58b1f48f0910efa0";
    owner = "ros-gbp";
    sha256 = "sha256-QGpvmDBlHMOXfznlkGsVUFaV62wHa1+BFxs/+UDotSE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ camera-calibration-parsers camera-info-manager image-transport polled-camera ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Common code for working with images in ROS.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
