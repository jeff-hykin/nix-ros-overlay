
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, catkin, control-toolbox, diagnostic-msgs, diagnostic-updater, filters, geometry-msgs, message-generation, message-runtime, nav-msgs, pluginlib, pr2-controller-interface, pr2-controllers-msgs, pr2-mechanism-model, pr2-mechanism-msgs, pr2-msgs, realtime-tools, robot-mechanism-controllers, rosconsole, roscpp, rospy, std-msgs, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-pr2-mechanism-controllers";
  version = "1.10.17-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_controllers-release";
    rev = "95916a2b133b69b7fb48b463ab8ff6bc803b24fc";
    owner = "pr2-gbp";
    sha256 = "sha256-3kqA4xkH0LSRRBpwYA0sq3Iwe3pNJmQAJmxdg1MT0u4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ angles control-toolbox diagnostic-msgs diagnostic-updater filters geometry-msgs message-runtime nav-msgs pluginlib pr2-controller-interface pr2-controllers-msgs pr2-mechanism-model pr2-mechanism-msgs pr2-msgs realtime-tools robot-mechanism-controllers rosconsole roscpp rospy std-msgs tf visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pr2_mechanism_controllers package contains realtime
    controllers that are meant for specific mechanisms of the PR2.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
