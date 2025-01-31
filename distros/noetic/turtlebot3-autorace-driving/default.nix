
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, nav-msgs, pythonPackages, rospy, sensor-msgs, std-msgs, tf, turtlebot3-autorace-msgs }:
buildRosPackage {
  pname = "ros-noetic-turtlebot3-autorace-driving";
  version = "1.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3_autorace_2020_release";
    rev = "73c20101b1bcb2b369b8bfb1f452538426ba0909";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-cslPS4KeV/oso/3gRrybMvT2uHLyS432yb02uA4X0c0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs pythonPackages.enum34 pythonPackages.numpy rospy sensor-msgs std-msgs tf turtlebot3-autorace-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''TurtleBot3 AutoRace ROS package that TurtleBot3 Auto driving'';
    license = with lib.licenses; [ asl20 ];
  };
}
