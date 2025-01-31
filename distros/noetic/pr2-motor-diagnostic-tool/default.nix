
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ethercat-hardware, pluginlib, pr2-controller-interface, pr2-mechanism-model, pr2-mechanism-msgs, rospy, rqt-gui, rqt-gui-py }:
buildRosPackage {
  pname = "ros-noetic-pr2-motor-diagnostic-tool";
  version = "1.0.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_self_test-release";
    rev = "a79598f5bf609bc2f0be367eeec179b51cd9e97d";
    owner = "pr2-gbp";
    sha256 = "sha256-5/DmXkwkphIODg+r/GVnWBBFwgrf+oZMOZpX6JZK1UE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ethercat-hardware pluginlib pr2-controller-interface pr2-mechanism-model pr2-mechanism-msgs rospy rqt-gui rqt-gui-py ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''pr2_motor_diagnostic_tool'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
