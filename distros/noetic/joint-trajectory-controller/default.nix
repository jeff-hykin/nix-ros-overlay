
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, angles, boost, catkin, code-coverage, control-msgs, control-toolbox, controller-interface, controller-manager, hardware-interface, pluginlib, realtime-tools, roscpp, rostest, std-msgs, trajectory-msgs, urdf, xacro }:
buildRosPackage {
  pname = "ros-noetic-joint-trajectory-controller";
  version = "0.21.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_controllers-release";
    rev = "97f4b4fc5e0897a51393beb14b26dc9bfbb24b57";
    owner = "ros-gbp";
    sha256 = "sha256-op5SNWQOTRJSJwpwq0Omknqjiljb8ljh0yK5z4iCTyU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pluginlib ];
  checkInputs = [ code-coverage controller-manager rostest std-msgs xacro ];
  propagatedBuildInputs = [ actionlib angles boost control-msgs control-toolbox controller-interface hardware-interface realtime-tools roscpp trajectory-msgs urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Controller for executing joint-space trajectories on a group of joints.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
