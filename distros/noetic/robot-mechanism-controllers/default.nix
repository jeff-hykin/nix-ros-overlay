
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, angles, catkin, control-msgs, control-toolbox, diagnostic-msgs, eigen-conversions, filters, geometry-msgs, kdl-parser, libtool, message-filters, message-generation, message-runtime, pluginlib, pr2-controller-interface, pr2-controller-manager, pr2-controllers-msgs, pr2-mechanism-model, realtime-tools, roscpp, rospy, std-msgs, tf, tf-conversions, trajectory-msgs }:
buildRosPackage {
  pname = "ros-noetic-robot-mechanism-controllers";
  version = "1.10.18-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_controllers-release";
    rev = "2b8d04a072641a20428871f149101f3255eda11d";
    owner = "pr2-gbp";
    sha256 = "sha256-RnXYk4DThTW3YkHJ5Eeq9NNe3Iz+Bjzk1l3dwFKupOU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib angles control-msgs control-toolbox diagnostic-msgs eigen-conversions filters geometry-msgs kdl-parser libtool message-filters message-runtime pluginlib pr2-controller-interface pr2-controller-manager pr2-controllers-msgs pr2-mechanism-model realtime-tools roscpp rospy std-msgs tf tf-conversions trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Generic Mechanism Controller Library'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
