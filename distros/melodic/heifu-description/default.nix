
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-dev, roslaunch, urdf, xacro }:
buildRosPackage {
  pname = "ros-melodic-heifu-description";
  version = "0.7.7-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "heifu-release";
    rev = "55e8ac7e81d194fa494a88d90e4356c8ce1b6fb7";
    owner = "BV-OpenSource";
    sha256 = "sha256-z95jA0XplKk2/jykWjyI9VJaVg2pA4EQbdVv//rXTCE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-dev roslaunch urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''SDF robot description for HEIFU'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
