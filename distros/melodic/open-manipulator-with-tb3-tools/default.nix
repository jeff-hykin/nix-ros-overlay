
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, amcl, ar-track-alvar-msgs, catkin, geometry-msgs, joint-state-publisher, map-server, move-base, moveit-core, moveit-msgs, moveit-ros-planning, moveit-ros-planning-interface, nav-msgs, open-manipulator-msgs, robot-state-publisher, roscpp, roslaunch, rospy, smach, smach-ros, std-msgs, trajectory-msgs }:
buildRosPackage {
  pname = "ros-melodic-open-manipulator-with-tb3-tools";
  version = "1.1.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "open_manipulator_with_tb3-release";
    rev = "eb20951c77e61ac7e7cd88675f87327293f5dd78";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-h5XlSgkrDoG5ZtYyNvhmPsL58u33ucTdCEKpQsKuXHw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ amcl ar-track-alvar-msgs geometry-msgs joint-state-publisher map-server move-base moveit-core moveit-msgs moveit-ros-planning moveit-ros-planning-interface nav-msgs open-manipulator-msgs robot-state-publisher roscpp roslaunch rospy smach smach-ros std-msgs trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The tools package(including SLAM, Navigation, Manipulation) for OpenManipulator with TurtleBot3'';
    license = with lib.licenses; [ asl20 ];
  };
}
