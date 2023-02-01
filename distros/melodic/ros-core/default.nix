
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, class-loader, cmake-modules, common-msgs, gencpp, geneus, genlisp, genmsg, gennodejs, genpy, message-generation, message-runtime, pluginlib, ros, ros-comm, rosbag-migration-rule, rosconsole, rosconsole-bridge, roscpp-core, rosgraph-msgs, roslisp, rospack, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-ros-core";
  version = "1.4.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "metapackages-release";
    rev = "d2977dee482da842133c80a997da948dc3ccefb6";
    owner = "ros-gbp";
    sha256 = "sha256-EshoXxvlz860QvWDGuwU9W/Y3qqb88CaF2fEzeWs7SA=";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ catkin class-loader cmake-modules common-msgs gencpp geneus genlisp genmsg gennodejs genpy message-generation message-runtime pluginlib ros ros-comm rosbag-migration-rule rosconsole rosconsole-bridge roscpp-core rosgraph-msgs roslisp rospack std-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A metapackage to aggregate the packages required to use publish / subscribe, services, launch files, and other core ROS concepts.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
