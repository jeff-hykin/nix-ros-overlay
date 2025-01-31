
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pr2-mechanism-msgs, pr2-tuck-arms-action, rospy, trajectory-msgs }:
buildRosPackage {
  pname = "ros-melodic-pr2-tuckarm";
  version = "0.6.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_apps-release";
    rev = "4d28b754d3b2ec24f9cfad659efcbf0bb37e31d1";
    owner = "pr2-gbp";
    sha256 = "sha256-ZwsMlZxu6UILJtxORbyh7z3Xa6aOnQM53vWH3DvUI7U=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pr2-mechanism-msgs pr2-tuck-arms-action rospy trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Tucks the arms of the PR2 robot into a safe position for moving the base of the robot.
     This also moves the arms out of the view of the tilting laser scanner, as much as possible.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
