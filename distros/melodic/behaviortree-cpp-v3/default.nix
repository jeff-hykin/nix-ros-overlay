
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cppzmq, ncurses, ros-environment, roslib }:
buildRosPackage {
  pname = "ros-melodic-behaviortree-cpp-v3";
  version = "3.8.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "behaviortree_cpp_v3-release";
    rev = "73c8495cf9003c95bb78c17124472c6fcaf54141";
    owner = "BehaviorTree";
    sha256 = "sha256-zq/X+gs+jKx0Kd1+b1OjjwTc0e6v8pdBqc5XH0M/WsE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ros-environment ];
  propagatedBuildInputs = [ boost cppzmq ncurses roslib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides the Behavior Trees core library.'';
    license = with lib.licenses; [ mit ];
  };
}
