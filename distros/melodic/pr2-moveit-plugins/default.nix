
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, angles, catkin, cmake-modules, control-msgs, eigen-conversions, kdl-parser, moveit-core, pluginlib, pr2-controllers-msgs, pr2-mechanism-msgs, rosconsole, roscpp, tf, tf-conversions, urdf }:
buildRosPackage {
  pname = "ros-melodic-pr2-moveit-plugins";
  version = "0.7.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "moveit_pr2-release";
    rev = "5b7ff0e5fd318d1bbc333cc7016741125b76a98a";
    owner = "ros-gbp";
    sha256 = "sha256-s9GhFS41PEPfyjcmiGCbrlMcu6GtcS/cjicDBTe9rZA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules ];
  propagatedBuildInputs = [ actionlib angles control-msgs eigen-conversions kdl-parser moveit-core pluginlib pr2-controllers-msgs pr2-mechanism-msgs rosconsole roscpp tf tf-conversions urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''PR2 specific plugins for MoveIt'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
