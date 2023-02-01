
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, scaled-joint-trajectory-controller, speed-scaling-interface, speed-scaling-state-controller }:
buildRosPackage {
  pname = "ros-melodic-scaled-controllers";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "Universal_Robots_ROS_scaled_controllers-release";
    rev = "a1da1c88388a0ec24ca07c3dde576ab9f858942a";
    owner = "UniversalRobots";
    sha256 = "sha256-aMcK8c5WS85vYboHV04KmtAEM3bx0yExlt73qAmWd38=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ scaled-joint-trajectory-controller speed-scaling-interface speed-scaling-state-controller ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''scaled controllers metapackage'';
    license = with lib.licenses; [ asl20 ];
  };
}
