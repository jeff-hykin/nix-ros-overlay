
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, geometry-msgs, pr2-common-action-msgs, pr2-controllers-msgs, roscpp, tf, urdf }:
buildRosPackage {
  pname = "ros-melodic-pr2-arm-move-ik";
  version = "0.0.11";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_common_actions-release";
    rev = "bb6d7de628a9f922f584b2fc7b7eca13975e20bb";
    owner = "pr2-gbp";
    sha256 = "sha256-YbCITHIaouXm/Y4q+oS2PtNa8LyW3sYV0QKA6usC6vQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib actionlib-msgs geometry-msgs pr2-common-action-msgs pr2-controllers-msgs roscpp tf urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Move the pr2 arm using inverse kinematics'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
