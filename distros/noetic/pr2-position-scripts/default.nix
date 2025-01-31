
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, pr2-controllers-msgs, roslaunch, rospy, rostest, tf }:
buildRosPackage {
  pname = "ros-noetic-pr2-position-scripts";
  version = "0.6.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_apps-release";
    rev = "ba0b92072899261c67c1adaaa65f362165db255c";
    owner = "pr2-gbp";
    sha256 = "sha256-OPPNSPuUeRCHYYVvQlpE97eUHjALkqZN/zp17yvROiE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ actionlib pr2-controllers-msgs rospy tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains a number of scripts to set various components of the PR2. They are used in the apps to improve usablity.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
