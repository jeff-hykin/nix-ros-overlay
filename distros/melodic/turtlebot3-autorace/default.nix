
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, turtlebot3-autorace-camera, turtlebot3-autorace-control, turtlebot3-autorace-core, turtlebot3-autorace-detect }:
buildRosPackage {
  pname = "ros-melodic-turtlebot3-autorace";
  version = "1.2.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3_autorace-release";
    rev = "8fa8b81476b5e1a33a583ca302f5ba2536fa2c6e";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-YhCPwXVjUAz5o8zlgSRwZ169j+mqgbWk4bCPm2o4xlo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ turtlebot3-autorace-camera turtlebot3-autorace-control turtlebot3-autorace-core turtlebot3-autorace-detect ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''AutoRace ROS packages for AutoRace with TurtleBot3 (meta package)'';
    license = with lib.licenses; [ asl20 ];
  };
}
