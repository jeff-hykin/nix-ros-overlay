
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, opencv, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-image-geometry";
  version = "1.16.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "vision_opencv-release";
    rev = "41fc84535640e16d6d3117fdfca3e6caa87d2514";
    owner = "ros-gbp";
    sha256 = "sha256-UzDpks0afc5sRLJDSiVmTo+pNTWZ6OKawChid5Z8wV4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ opencv sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''`image_geometry` contains C++ and Python libraries for interpreting images
    geometrically. It interfaces the calibration parameters in sensor_msgs/CameraInfo
    messages with OpenCV functions such as image rectification, much as cv_bridge
    interfaces ROS sensor_msgs/Image with OpenCV data types.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
