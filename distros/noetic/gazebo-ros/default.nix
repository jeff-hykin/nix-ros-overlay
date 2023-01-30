
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, dynamic-reconfigure, gazebo-dev, gazebo-msgs, geometry-msgs, python, roscpp, rosgraph-msgs, roslib, std-msgs, std-srvs, tf, tinyxml }:
buildRosPackage {
  pname = "ros-noetic-gazebo-ros";
  version = "2.9.2-r1";

  src = fetchurl {
    url = "https://github.com/ros-gbp/gazebo_ros_pkgs-release/archive/release/noetic/gazebo_ros/2.9.2-1.tar.gz";
    name = "2.9.2-1.tar.gz";
    sha256 = "1y4ama21gxsp8bm4xzvp226nnb0rnwkp667q0bn0sy2agm2w0laq";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules ];
  propagatedBuildInputs = [ dynamic-reconfigure gazebo-dev gazebo-msgs geometry-msgs python roscpp rosgraph-msgs roslib std-msgs std-srvs tf tinyxml ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Provides ROS plugins that offer message and service publishers for interfacing with <a href="http://gazebosim.org">Gazebo</a> through ROS.
    Formally simulator_gazebo/gazebo'';
    license = with lib.licenses; [ asl20 ];
  };
}
