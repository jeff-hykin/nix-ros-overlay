
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, drone-assets, drone-circuit-assets, drone-wrapper, rqt-drone-teleop, rqt-ground-robot-teleop, tello-driver }:
buildRosPackage {
  pname = "ros-noetic-jderobot-drones";
  version = "1.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "drones-release";
    rev = "0d8bced58d645b1aaa949f2f659c9a9199af29e3";
    owner = "JdeRobot";
    sha256 = "sha256-0I0g+OpGxoW3RhCP9OtI4rl71VeFEKc3Qepm1hz3q5g=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ drone-assets drone-circuit-assets drone-wrapper rqt-drone-teleop rqt-ground-robot-teleop tello-driver ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The jderobot_drones stack'';
    license = with lib.licenses; [ mit ];
  };
}
