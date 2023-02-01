
# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, controller-manager, moveit-common, moveit-resources-panda-moveit-config, moveit-ros-move-group, moveit-ros-planning-interface, robot-state-publisher, rviz2, tf2-ros, warehouse-ros-mongo }:
buildRosPackage {
  pname = "ros-galactic-run-move-group";
  version = "2.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "moveit2-release";
    rev = "7bd36004f9f9ab0d1aedfc60cce2ee3e377ca95f";
    owner = "moveit";
    sha256 = "sha256-nFHoD5eZEPKOU2+Yedlsmm8svbQ59r3ALXWs1T4ykoI=";
  };

  buildType = "ament_cmake";
  buildInputs = [ moveit-common ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ controller-manager moveit-resources-panda-moveit-config moveit-ros-move-group moveit-ros-planning-interface robot-state-publisher rviz2 tf2-ros warehouse-ros-mongo ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Demo launch file for running a MoveGroup setup'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
