
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, collada-urdf-jsk-patch, gazebo-ros, pythonPackages, roseus, rostest }:
buildRosPackage {
  pname = "ros-melodic-eusurdf";
  version = "0.4.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_model_tools-release";
    rev = "2ed33bd00475f76b7b0a93617f00b60c656e2e8a";
    owner = "tork-a";
    sha256 = "sha256-RPIEw9htKgsXZ4hb6vjPYQeRWgJz5EZKxdbop97NaBM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roseus ];
  propagatedBuildInputs = [ collada-urdf-jsk-patch gazebo-ros pythonPackages.lxml rostest ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''urdf models converted from euslisp'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
