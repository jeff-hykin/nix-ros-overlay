
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, dynamic-reconfigure, gazebo-dev, gazebo-msgs, geometry-msgs, python, roscpp, rosgraph-msgs, roslib, std-msgs, std-srvs, tf, tinyxml }:
buildRosPackage {
  pname = "ros-melodic-gazebo-ros";
  version = "2.8.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "gazebo_ros_pkgs-release";
    rev = "902edcc2436d3ac578a0ab136b8aa6f40e4189a6";
    owner = "ros-gbp";
    sha256 = "sha256-3f8ewQO/MVhD+qgaV1gnZag/ok7miaKJ7qMQ0RsKfqE=";
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
