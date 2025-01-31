
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pr2-mechanism-msgs, pr2-tuck-arms-action, roslaunch, rospy, rostest, trajectory-msgs }:
buildRosPackage {
  pname = "ros-noetic-pr2-tuckarm";
  version = "0.6.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_apps-release";
    rev = "1368c60ba6a0bf6ec2bd20b7a079ed66c25cd3dc";
    owner = "pr2-gbp";
    sha256 = "sha256-2Cw3Ofax2OZMVs10tV3st7oj0w7ucNAcyhDJoJSk0zA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ pr2-mechanism-msgs pr2-tuck-arms-action rospy trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Tucks the arms of the PR2 robot into a safe position for moving the base of the robot.
     This also moves the arms out of the view of the tilting laser scanner, as much as possible.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
