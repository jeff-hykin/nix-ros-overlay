
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages, roslib, rosnode, rospy }:
buildRosPackage {
  pname = "ros-noetic-ros-system-fingerprint";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_system_fingerprint-release";
    rev = "53ea31bf6bf57713aeaa472f62c422f1c68aa06e";
    owner = "MetroRobots";
    sha256 = "sha256-BX5JRRs4JTIo6fd/7LemO+HZja5hckQGgR5mPLVevQ0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ python3Packages.GitPython roslib rosnode rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The ros_system_fingerprint package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
