
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, catkin, cmake-modules, geometry-msgs, kdl-parser, moveit-core, moveit-msgs, pluginlib, roscpp, tf-conversions, urdf }:
buildRosPackage {
  pname = "ros-noetic-pr2-arm-kinematics";
  version = "1.0.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_kinematics-release";
    rev = "ea26fd6d5e76d8ce89fa5c2826023d898bbb59cf";
    owner = "pr2-gbp";
    sha256 = "sha256-x9tmC8pof/LT3Fs9oJ2dpr/uCCt8r8uPrpJ2SpfT9mg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules ];
  propagatedBuildInputs = [ angles geometry-msgs kdl-parser moveit-core moveit-msgs pluginlib roscpp tf-conversions urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides a kinematics implementation for the PR2 robot. It can be used to compute forward and inverse kinematics.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
