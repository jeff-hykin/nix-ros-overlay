
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-asmach";
  version = "1.0.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "linux_networking-release";
    rev = "45de46f8bdd0a5c6417259fbbbc48075aa9ebb45";
    owner = "pr2-gbp";
    sha256 = "sha256-ChdnDNcg//cY4aCVbTWSSwCz2pJVXZxn678dR65zVSI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''SMACH, which stands for 'state machine', is a task-level
    architecture for rapidly creating complex robot behavior. At its
    core, SMACH is a ROS-independent Python library to build
    hierarchical state machines.  SMACH is a new library that takes
    advantage of very old concepts in order to quickly create robust
    robot behavior with maintainable and modular code.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
