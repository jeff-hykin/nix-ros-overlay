
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, dynamic-reconfigure, python3Packages, pythonPackages, rospy, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-turtlebot3-autorace-camera";
  version = "1.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3_autorace_2020_release";
    rev = "2d5f69c1a75a968a95a12296b8c7ad6fb2e9b26f";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-IxFFJdII6nzyCVHxr/PZJi+VytYgdDXdJKuiCbWWj3k=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge dynamic-reconfigure python3Packages.opencv3 pythonPackages.enum34 pythonPackages.numpy rospy sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''TurtleBot3 AutoRace ROS package that controls Raspberry Pi Camera, and process the image'';
    license = with lib.licenses; [ asl20 ];
  };
}
