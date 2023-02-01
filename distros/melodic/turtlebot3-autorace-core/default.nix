
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pythonPackages, roslaunch, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-turtlebot3-autorace-core";
  version = "1.2.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3_autorace-release";
    rev = "559c19f87e763ef727f68c93f955f0e547be8a04";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-kEb8+S1RTdIyGaDBrZrQl8bQSt/wu+XeFTD9RFnGtJI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pythonPackages.enum34 pythonPackages.numpy roslaunch rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''TurtleBot3 AutoRace ROS package that TurtleBot3 Auto's core'';
    license = with lib.licenses; [ asl20 ];
  };
}
