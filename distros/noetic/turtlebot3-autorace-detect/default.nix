
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, dynamic-reconfigure, geometry-msgs, move-base-msgs, nav-msgs, python3Packages, pythonPackages, rospy, sensor-msgs, std-msgs, tf }:
buildRosPackage {
  pname = "ros-noetic-turtlebot3-autorace-detect";
  version = "1.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3_autorace_2020_release";
    rev = "63092a961bca4bbc5fd14fcc03fba419be17c22a";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-PN0Hc6lwr6DuW/+MSm0LhW/NdZYaNP1LCO9s/1UhAc4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge dynamic-reconfigure geometry-msgs move-base-msgs nav-msgs python3Packages.opencv3 pythonPackages.enum34 pythonPackages.numpy rospy sensor-msgs std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''AutoRace ROS packages for feature detection with TurtleBot3 Auto'';
    license = with lib.licenses; [ asl20 ];
  };
}
