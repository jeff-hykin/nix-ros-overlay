
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, image-geometry }:
buildRosPackage {
  pname = "ros-melodic-vision-opencv";
  version = "1.13.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "vision_opencv-release";
    rev = "b65d806138bc17717a290d16fe06330dc2920af9";
    owner = "ros-gbp";
    sha256 = "sha256-KPAttZSCg9LxLt8BAJm5Ceb2aVUJJvqKKQZv2wfLCHE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge image-geometry ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Packages for interfacing ROS with OpenCV, a library of programming functions for real time computer vision.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
