
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, canopen-master, catkin, diagnostic-updater, message-generation, message-runtime, pluginlib, rosconsole-bridge, roscpp, roslib, socketcan-interface, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-noetic-canopen-chain-node";
  version = "0.8.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_canopen-release";
    rev = "91cfbaf6595d6950e51f2bdd3a56d63c3922536b";
    owner = "ros-industrial-release";
    sha256 = "sha256-GVUHL4gKOePn64morrMeQqAurcRx9TkMFq9XLDxAWHM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ canopen-master diagnostic-updater message-runtime pluginlib rosconsole-bridge roscpp roslib socketcan-interface std-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Base implementation for CANopen chains node with support for management services and diagnostics'';
    license = with lib.licenses; [ lgpl3Only ];
  };
}
