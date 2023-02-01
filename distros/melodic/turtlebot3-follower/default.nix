
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, nav-msgs, rospy, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-turtlebot3-follower";
  version = "1.1.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3_applications-release";
    rev = "4cf0d5c2aa04157e5e4ec355a9357f760e167e27";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-SyB+Z4JwR1xAIgNR59Tq2pAWnznQIwbB22BL1OT3ZLc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rospy sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The follower demo was implemented using a 360 Laser Distance Sensor LDS-01. The classification algorithm is used based on previous fitting with samples of person and obstacles positions to take actions. It follows someone in front of the robot within a 50 centimeter range and 140 degrees.'';
    license = with lib.licenses; [ asl20 ];
  };
}
