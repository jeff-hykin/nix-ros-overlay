
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, catkin, dynamic-reconfigure, libyamlcpp, nodelet, pcl-conversions, pcl-ros, pluginlib, roscpp, roslaunch, roslib, rostest, rosunit, sensor-msgs, tf, tf2-ros, velodyne-driver, velodyne-laserscan, velodyne-msgs }:
buildRosPackage {
  pname = "ros-melodic-velodyne-pointcloud";
  version = "1.5.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "velodyne-release";
    rev = "c814042fe9fe0511637debaede97c34d14cc08bd";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-7H3+glfK5vpInojgopVHvxc/QhfnnDOEP1EXWb+dp7A=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest rosunit tf2-ros ];
  propagatedBuildInputs = [ angles dynamic-reconfigure libyamlcpp nodelet pcl-conversions pcl-ros pluginlib roscpp roslib sensor-msgs tf velodyne-driver velodyne-laserscan velodyne-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Point cloud conversions for Velodyne 3D LIDARs.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
