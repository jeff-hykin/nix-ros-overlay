
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, color-util, robot-nav-rviz-plugins, robot-nav-viz-demos }:
buildRosPackage {
  pname = "ros-melodic-robot-nav-tools";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_navigation-release";
    rev = "dd8c0b9da6c3a3bf4d7c9c1285531e8eea2373e3";
    owner = "DLu";
    sha256 = "sha256-Yeq/YTXPWZcfD4J0JS6aT3aEwvmbzaMkT807mkC+8Ok=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ color-util robot-nav-rviz-plugins robot-nav-viz-demos ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A collection of tools / accessories for the robot_navigation packages'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
