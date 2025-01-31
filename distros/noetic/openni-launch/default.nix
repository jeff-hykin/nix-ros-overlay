
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nodelet, openni-camera, rgbd-launch, roslaunch }:
buildRosPackage {
  pname = "ros-noetic-openni-launch";
  version = "1.11.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "openni_camera-release";
    rev = "e7de3bac68336da4d739af95df9e94aa950c9b79";
    owner = "ros-gbp";
    sha256 = "sha256-UPmDcE5p6y1cZm960uo5+Pg3krFN3mKExu/uG4Hhvrw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslaunch ];
  propagatedBuildInputs = [ nodelet openni-camera rgbd-launch ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launch files to open an OpenNI device and load all nodelets to 
     convert raw depth/RGB/IR streams to depth images, disparity images, 
     and (registered) point clouds.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
