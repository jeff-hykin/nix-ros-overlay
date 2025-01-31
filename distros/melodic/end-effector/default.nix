
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gtest, joint-state-publisher-gui, kdl-parser, libyamlcpp, message-runtime, moveit-ros-planning-interface, muparser, roscpp, rosee-msg, rospy, srdfdom }:
buildRosPackage {
  pname = "ros-melodic-end-effector";
  version = "1.0.6-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ROSEndEffector-release";
    rev = "9da7f61ae8bac44d510fc8ebba187ac23457faf9";
    owner = "ADVRHumanoids";
    sha256 = "sha256-qNG84bFQrv2nJhG77gjKzIBSk4te/eT9PabjE6tA06c=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ joint-state-publisher-gui kdl-parser libyamlcpp message-runtime moveit-ros-planning-interface muparser roscpp rosee-msg rospy srdfdom ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''End-Effector package: provides a ROS-based set of standard interfaces to command robotics end-effectors in an agnostic fashion'';
    license = with lib.licenses; [ asl20 ];
  };
}
