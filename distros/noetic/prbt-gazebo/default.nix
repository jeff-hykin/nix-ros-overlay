
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, gazebo-ros, gazebo-ros-control, prbt-moveit-config, prbt-support, roscpp, roslaunch, rostest, trajectory-msgs, xacro }:
buildRosPackage {
  pname = "ros-noetic-prbt-gazebo";
  version = "0.6.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pilz_robots-release";
    rev = "74e0d00fc103e52b79efc6bf61678beef82410bf";
    owner = "PilzDE";
    sha256 = "sha256-ZH++mpfc8kWmp505WVHvWkfL8WS9tag6ePBg18eKJoA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ actionlib roscpp rostest trajectory-msgs ];
  propagatedBuildInputs = [ gazebo-ros gazebo-ros-control prbt-moveit-config prbt-support roslaunch xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launch prbt robot in an empty Gazebo world.'';
    license = with lib.licenses; [ asl20 ];
  };
}
