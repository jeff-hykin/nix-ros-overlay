
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, dynamic-reconfigure, pythonPackages, rospy, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-turtlebot3-autorace-camera";
  version = "1.2.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3_autorace-release";
    rev = "ec62387aa2f5ffc44b59c39a1da06acb3d656366";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-868c2pFq8Qh/sBgiLKQnufeglYJjC8nm0HUbKnhdOh8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge dynamic-reconfigure pythonPackages.enum34 pythonPackages.numpy pythonPackages.opencv3 rospy sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''TurtleBot3 AutoRace ROS package that controls Raspberry Pi Camera, and process the image'';
    license = with lib.licenses; [ asl20 ];
  };
}
