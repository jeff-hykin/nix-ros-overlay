
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, geometry-msgs, move-base-msgs, nav-msgs, pluginlib, roscpp, rsm-core, rsm-msgs, sensor-msgs, std-msgs, std-srvs, tf, tf2, tf2-ros, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-rsm-additions";
  version = "1.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_statemachine-release";
    rev = "d2d6360257e6cf6b4820262c8888a98e070b8c0d";
    owner = "MarcoStb1993";
    sha256 = "sha256-IaaPYwJ6+NH5G/igW/ckWf0ODAZjy35TVphkX+XCtwE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib actionlib-msgs geometry-msgs move-base-msgs nav-msgs pluginlib roscpp rsm-core rsm-msgs sensor-msgs std-msgs std-srvs tf tf2 tf2-ros visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rsm_additions package includes plugins for the Robot
		Statemachine and exemplary launch files'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
