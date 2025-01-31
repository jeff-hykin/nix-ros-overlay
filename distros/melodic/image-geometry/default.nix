
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, opencv, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-image-geometry";
  version = "1.13.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "vision_opencv-release";
    rev = "c5587ffb98c066f5970143a9e59434050a307fb9";
    owner = "ros-gbp";
    sha256 = "sha256-G2hloVRaDZSVMqW27ndR3SOfz3kI4oK9jN4kQE8tc3I=";
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
