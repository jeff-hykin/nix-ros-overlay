
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-interface, kdl-parser, realtime-tools, rm-common, roscpp, tf2-kdl }:
buildRosPackage {
  pname = "ros-noetic-robot-state-controller";
  version = "0.1.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rm_controllers-release";
    rev = "fb49e6bb0b15141372b0b40a353b6ef5e7e158a5";
    owner = "rm-controls";
    sha256 = "sha256-2geSWtlcmmreuGS3JynN30tdhtBkCOS3Xzn6tFvJaa8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ controller-interface kdl-parser realtime-tools rm-common roscpp tf2-kdl ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A template for ROS packages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
