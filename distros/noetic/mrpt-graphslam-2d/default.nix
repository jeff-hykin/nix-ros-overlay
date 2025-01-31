
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, fkie-multimaster-msgs, geometry-msgs, mrpt-msgs, mrpt-msgs-bridge, mrpt2, nav-msgs, roscpp, rospy, sensor-msgs, std-msgs, tf2, tf2-geometry-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-noetic-mrpt-graphslam-2d";
  version = "0.1.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrpt_slam-release";
    rev = "dfce6e04628edff9ab8151cd03ec5de9f945abf3";
    owner = "mrpt-ros-pkg-release";
    sha256 = "sha256-DWL5d5HjwdDSHXeCGc10tF3EpRuznaZcBEAxnORLL9o=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ fkie-multimaster-msgs geometry-msgs mrpt-msgs mrpt-msgs-bridge mrpt2 nav-msgs roscpp rospy sensor-msgs std-msgs tf2 tf2-geometry-msgs tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Implement graphSLAM using the mrpt-graphslam library, in an online fashion
  	by directly reading measurements off ROS Topics.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
