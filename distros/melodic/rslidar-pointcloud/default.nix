
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, catkin, dynamic-reconfigure, nodelet, pcl-conversions, pcl-ros, pluginlib, roscpp, roslaunch, roslib, rostest, rslidar-driver, rslidar-msgs, sensor-msgs, tf, tf2-ros }:
buildRosPackage {
  pname = "ros-melodic-rslidar-pointcloud";
  version = "1.0.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robosense-release";
    rev = "7dbdafb02e7f0637e1305b3c7a806b707b5f62c1";
    owner = "CPFL";
    sha256 = "sha256-9on+vcFAiCyYgYHRSthq63y73GUDaxERmq/if+PM4lA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pcl-conversions roslaunch rostest tf2-ros ];
  propagatedBuildInputs = [ angles dynamic-reconfigure nodelet pcl-ros pluginlib roscpp roslib rslidar-driver rslidar-msgs sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Point cloud conversions for rslidar 3D LIDARs.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
