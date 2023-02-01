
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, catkin, control-msgs, control-toolbox, controller-interface, controller-manager, forward-command-controller, hardware-interface, joint-state-controller, pluginlib, realtime-tools, robot-state-publisher, roscpp, rosgraph-msgs, rostest, sensor-msgs, std-msgs, urdf, xacro }:
buildRosPackage {
  pname = "ros-noetic-effort-controllers";
  version = "0.21.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_controllers-release";
    rev = "e62686f527a32100ec5618b95d604ac2cfb34dd3";
    owner = "ros-gbp";
    sha256 = "sha256-QdheB80m7o5ZeDQHLEWw24Vql/gWSBD9YhMlFIhYirU=";
  };

  buildType = "catkin";
  buildInputs = [ angles catkin pluginlib ];
  checkInputs = [ controller-manager joint-state-controller robot-state-publisher rosgraph-msgs rostest sensor-msgs xacro ];
  propagatedBuildInputs = [ control-msgs control-toolbox controller-interface forward-command-controller hardware-interface realtime-tools roscpp std-msgs urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''effort_controllers'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
