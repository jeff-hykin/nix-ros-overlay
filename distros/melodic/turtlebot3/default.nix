
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, turtlebot3-bringup, turtlebot3-description, turtlebot3-example, turtlebot3-navigation, turtlebot3-slam, turtlebot3-teleop }:
buildRosPackage {
  pname = "ros-melodic-turtlebot3";
  version = "1.2.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3-release";
    rev = "a0c94c8d006cca01882e27a6c7fe743b90b1e28c";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-SU4ybJCdTW15hpQ0GnGfnmgggYfL4fQna7krrMH3kYc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ turtlebot3-bringup turtlebot3-description turtlebot3-example turtlebot3-navigation turtlebot3-slam turtlebot3-teleop ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS packages for the Turtlebot3 (meta package)'';
    license = with lib.licenses; [ asl20 bsdOriginal ];
  };
}
