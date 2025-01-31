
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, calibration-msgs, catkin, cmake-modules, geometry-msgs, kdl-parser, orocos-kdl, roscpp, roscpp-serialization }:
buildRosPackage {
  pname = "ros-melodic-laser-joint-projector";
  version = "1.0.11-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_calibration-release";
    rev = "1cbf2d5de5c3f6659a74efc6437d783cbf635beb";
    owner = "UNR-RoboticsResearchLab";
    sha256 = "sha256-EJExhTKIE7UT41dgEtVwLL9A1ZVW2ukmqa1rztvDryU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roscpp ];
  propagatedBuildInputs = [ calibration-msgs cmake-modules geometry-msgs kdl-parser orocos-kdl roscpp-serialization ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Projects laser readings into a point cloud, based on a set of recorded joint angles
     This package is experimental and unstable.
     Expect its APIs to change.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
