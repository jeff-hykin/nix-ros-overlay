
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eus-nlopt, eus-qp, eus-qpoases, joy-mouse, jsk-calibration, jsk-footstep-controller, jsk-footstep-planner, jsk-ik-server, jsk-teleop-joy }:
buildRosPackage {
  pname = "ros-noetic-jsk-control";
  version = "0.1.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_control-release";
    rev = "e000364e8e2b93c7d78bf762f31eeb4a87c012c1";
    owner = "tork-a";
    sha256 = "sha256-0TFki9mag61pN0NN5ibF6UgSLdBR/Oy126KoeuxQmj8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eus-nlopt eus-qp eus-qpoases joy-mouse jsk-calibration jsk-footstep-controller jsk-footstep-planner jsk-ik-server jsk-teleop-joy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The jsk_control package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
