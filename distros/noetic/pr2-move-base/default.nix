
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, dynamic-reconfigure, move-base-msgs, pr2-common-action-msgs, pr2-controllers-msgs, pr2-msgs, rospy }:
buildRosPackage {
  pname = "ros-noetic-pr2-move-base";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_navigation-release";
    rev = "cbcca386d52a7562a3041344706071c2763c57f3";
    owner = "pr2-gbp";
    sha256 = "sha256-lBiL/7M4Drg6HOyTNTC/t4fHsaNlVyPGo3Dy1liN47o=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib actionlib-msgs dynamic-reconfigure move-base-msgs pr2-common-action-msgs pr2-controllers-msgs pr2-msgs rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''pr2_move_base'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
