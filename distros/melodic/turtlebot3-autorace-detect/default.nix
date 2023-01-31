
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, dynamic-reconfigure, geometry-msgs, move-base-msgs, nav-msgs, pythonPackages, rospy, sensor-msgs, std-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-turtlebot3-autorace-detect";
  version = "1.2.0";

  src = fetchurl {
    url = "https://github.com/ROBOTIS-GIT-release/turtlebot3_autorace-release/archive/eb876e46161439c9948202f914a285ab16a5e3e0.tar.gz";
    sha256 = "sha256-97/3GqrLmdynA5gZuT/ZnkM9kZCNdLeZZtWBSH7hon0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge dynamic-reconfigure geometry-msgs move-base-msgs nav-msgs pythonPackages.enum34 pythonPackages.numpy pythonPackages.opencv3 rospy sensor-msgs std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''AutoRace ROS packages for feature detection with TurtleBot3 Auto'';
    license = with lib.licenses; [ asl20 ];
  };
}
