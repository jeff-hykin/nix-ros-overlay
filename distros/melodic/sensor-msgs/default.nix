
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, pythonPackages, rosbag, rosunit, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-sensor-msgs";
  version = "1.12.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "common_msgs-release";
    rev = "2cdaa5a77c8caa4874b8f31cf344e9f6fb9e1345";
    owner = "ros-gbp";
    sha256 = "sha256-BqeHou1Rffh4doC/5JDTc3ZIy3B0XbbD2SKU+94THgg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation pythonPackages.setuptools ];
  checkInputs = [ rosbag rosunit ];
  propagatedBuildInputs = [ geometry-msgs message-runtime std-msgs ];
  nativeBuildInputs = [ catkin pythonPackages.setuptools ];

  meta = {
    description = ''This package defines messages for commonly used sensors, including
    cameras and scanning laser rangefinders.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
