
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, angles, catkin, cmake-modules, code-coverage, control-msgs, control-toolbox, controller-interface, controller-manager, hardware-interface, pluginlib, realtime-tools, roscpp, rostest, trajectory-msgs, urdf, xacro }:
buildRosPackage {
  pname = "ros-melodic-joint-trajectory-controller";
  version = "0.17.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_controllers-release";
    rev = "f137269f946c541a3c8bdb67d895126698bb34b1";
    owner = "ros-gbp";
    sha256 = "sha256-5eX1sjnm+BRAKvtgAgexRMi1T1bPn7kgXJYksJKbgsI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules ];
  checkInputs = [ code-coverage controller-manager rostest xacro ];
  propagatedBuildInputs = [ actionlib angles control-msgs control-toolbox controller-interface hardware-interface pluginlib realtime-tools roscpp trajectory-msgs urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Controller for executing joint-space trajectories on a group of joints.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
