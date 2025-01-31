
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, pr2-controllers-msgs, rospy, tf }:
buildRosPackage {
  pname = "ros-melodic-pr2-position-scripts";
  version = "0.6.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_apps-release";
    rev = "0dda182e0893200544d08fb48dfe5037229b8c66";
    owner = "pr2-gbp";
    sha256 = "sha256-1sj067bxjkBIlqr/tXm8VojtTxurpGM8Raf+qSLOf64=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib pr2-controllers-msgs rospy tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains a number of scripts to set various components of the PR2. They are used in the apps to improve usablity.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
