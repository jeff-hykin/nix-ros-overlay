
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, dynamic-reconfigure, image-geometry, marker-msgs, roscpp, rospy, std-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-tuw-marker-pose-estimation";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tuw_marker_detection-release";
    rev = "8cc5b677cb5f0d456accefc759b5ec396edc43f5";
    owner = "tuw-robotics";
    sha256 = "sha256-VZ6SJ6+8Y96vq9YsEucfLiU6IBq0tQyqRCo9eY/00do=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge dynamic-reconfigure image-geometry marker-msgs roscpp rospy std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This node does pose estimation for detected fiducials (marker_msgs/FiducialDetection.msg)'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
