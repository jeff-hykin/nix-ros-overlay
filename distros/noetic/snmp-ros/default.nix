
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-snmp-ros";
  version = "1.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "snmp_ros-release";
    rev = "f7c126e27ecd795837caa65e0b5896e505a366a6";
    owner = "ctu-vras";
    sha256 = "sha256-Pk40w3RXhaUM1qTP5wrbrn3BF0XCP3TWZUVR9PyEarc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ python3Packages.pysnmp rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Utilities for working with SNMP from ROS'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
