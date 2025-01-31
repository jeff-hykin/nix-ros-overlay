
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, python3Packages, rosbag, rosunit, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-sensor-msgs";
  version = "1.13.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "common_msgs-release";
    rev = "eeddf5fcfdce7b5538f3d16267f50a4e0f02ebfc";
    owner = "ros-gbp";
    sha256 = "sha256-K49LddL5s/6G2jWccadDmNeqEBO0iqYLZV69azAP+FU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation python3Packages.setuptools ];
  checkInputs = [ rosbag rosunit ];
  propagatedBuildInputs = [ geometry-msgs message-runtime std-msgs ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''This package defines messages for commonly used sensors, including
    cameras and scanning laser rangefinders.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
