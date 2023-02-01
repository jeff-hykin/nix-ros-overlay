
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, mrpt-bridge, mrpt-msgs, mrpt1, multimaster-msgs-fkie, nav-msgs, roscpp, rospy, sensor-msgs, std-msgs, tf, tf2 }:
buildRosPackage {
  pname = "ros-melodic-mrpt-graphslam-2d";
  version = "0.1.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrpt_slam-release";
    rev = "c54bae060b9e90641bb7a2fcfd9ab5baa5424c95";
    owner = "mrpt-ros-pkg-release";
    sha256 = "sha256-qkZEnEZhVL3qUyp1ZvmMuBHNnqDEfNbh3UiwZDahjgM=";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ geometry-msgs mrpt-bridge mrpt-msgs mrpt1 multimaster-msgs-fkie nav-msgs roscpp rospy sensor-msgs std-msgs tf tf2 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Implement graphSLAM using the mrpt-graphslam library, in an online fashion
  	by directly reading measurements off ROS Topics.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
