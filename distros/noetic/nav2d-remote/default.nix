
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nav2d-navigator, nav2d-operator, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-nav2d-remote";
  version = "0.4.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_2d-release";
    rev = "147da5d9693513c679586b4c30b1b78d9bf2da11";
    owner = "skasperski";
    sha256 = "sha256-TuDjIIi50McRwdqBKc3tH4tQyybVPmyAslfDWeFfcJo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ nav2d-navigator nav2d-operator roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package is used to manually control a robot that uses the operator and
    navigator node from navigation_2d. Currently there is one node to control one
    robot with a joystick and one to control multiple robots in simulation.
    It can send commands directly to the operator or start and stop navigator actions.'';
    license = with lib.licenses; [ gpl3Only ];
  };
}
