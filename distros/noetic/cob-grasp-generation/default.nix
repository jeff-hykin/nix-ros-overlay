
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, cob-description, cob-manipulation-msgs, geometry-msgs, moveit-msgs, python3Packages, robot-state-publisher, roslib, rospy, rviz, schunk-description, sensor-msgs, std-msgs, tf, tf2-ros, trajectory-msgs, visualization-msgs, xacro }:
buildRosPackage {
  pname = "ros-noetic-cob-grasp-generation";
  version = "0.7.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_manipulation-release";
    rev = "cbdf70b8502230291776c1f33692980b9285190b";
    owner = "ipa320";
    sha256 = "sha256-Fc+Rt4p7Zj59eR6gJaNWjTk/oLF2onsrp+IqGuU4qQU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin python3Packages.setuptools ];
  propagatedBuildInputs = [ actionlib actionlib-msgs cob-description cob-manipulation-msgs geometry-msgs moveit-msgs python3Packages.scipy python3Packages.six robot-state-publisher roslib rospy rviz schunk-description sensor-msgs std-msgs tf tf2-ros trajectory-msgs visualization-msgs xacro ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''Grasp generation for Care-O-bot based on OpenRAVE'';
    license = with lib.licenses; [ asl20 ];
  };
}
