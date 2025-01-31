
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, app-manager, catkin, roslaunch, rostest, willow-maps }:
buildRosPackage {
  pname = "ros-noetic-pr2-app-manager";
  version = "0.6.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_apps-release";
    rev = "6900330caa03e8b1c3ddcf7c182a012d4ce29f54";
    owner = "pr2-gbp";
    sha256 = "sha256-AE03CQ3ekbYoUn2rzQSB57Z8kDNU6jfssE/jEvX1Gm4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ app-manager willow-maps ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Scripts and tools for running the application manager on the PR2.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
