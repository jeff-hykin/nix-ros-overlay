
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pythonPackages, rosbuild, rosclean, rosgraph-msgs, roslib, rosmaster, rosout, rosparam, rosunit }:
buildRosPackage {
  pname = "ros-melodic-roslaunch";
  version = "1.14.13-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_comm-release";
    rev = "e1923edaa0bdcd71d3841723ed0f4823540dc18a";
    owner = "ros-gbp";
    sha256 = "sha256-bjwrjxsyTh6wGMq7oUz1GVX8I0Fc+QpnXrwKd1QOn0g=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rosbuild ];
  propagatedBuildInputs = [ pythonPackages.paramiko pythonPackages.pyyaml pythonPackages.rospkg rosclean rosgraph-msgs roslib rosmaster rosout rosparam rosunit ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''roslaunch is a tool for easily launching multiple ROS <a href="http://ros.org/wiki/Nodes">nodes</a> locally and remotely
    via SSH, as well as setting parameters on the <a href="http://ros.org/wiki/Parameter Server">Parameter
    Server</a>. It includes options to automatically respawn processes
    that have already died. roslaunch takes in one or more XML
    configuration files (with the <tt>.launch</tt> extension) that
    specify the parameters to set and nodes to launch, as well as the
    machines that they should be run on.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
