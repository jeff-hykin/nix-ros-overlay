
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, controller-interface, controller-manager, controller-manager-msgs, diff-drive-controller, geometry-msgs, hardware-interface, nav-msgs, pluginlib, realtime-tools, roscpp, rostest, std-msgs, std-srvs, tf, urdfdom, xacro }:
buildRosPackage {
  pname = "ros-noetic-ackermann-steering-controller";
  version = "0.21.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_controllers-release";
    rev = "4feae3104f2f9f67ddddd9fcad4144d7260bbed9";
    owner = "ros-gbp";
    sha256 = "sha256-PqgklkXkTOU4SjLOAtkn+xy3JgATfXjE77HgVKduOQo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ controller-manager controller-manager-msgs geometry-msgs rostest std-msgs std-srvs xacro ];
  propagatedBuildInputs = [ boost controller-interface diff-drive-controller hardware-interface nav-msgs pluginlib realtime-tools roscpp tf urdfdom ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Controller for a steer drive mobile base.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
