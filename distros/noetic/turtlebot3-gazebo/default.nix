
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo, gazebo-ros, geometry-msgs, nav-msgs, roscpp, sensor-msgs, std-msgs, tf, turtlebot3-description }:
buildRosPackage {
  pname = "ros-noetic-turtlebot3-gazebo";
  version = "1.3.2-r2";

  src = fetchurl {
    url = "https://github.com/ROBOTIS-GIT-release/turtlebot3_simulations-release/archive/release/noetic/turtlebot3_gazebo/1.3.2-2.tar.gz";
    name = "1.3.2-2.tar.gz";
    sha256 = "0mg4msjha9g0c5mpi805za9dv56382x0swkrqcl5h72sirdify1g";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo gazebo-ros geometry-msgs nav-msgs roscpp sensor-msgs std-msgs tf turtlebot3-description ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Gazebo simulation package for the TurtleBot3'';
    license = with lib.licenses; [ asl20 ];
  };
}
