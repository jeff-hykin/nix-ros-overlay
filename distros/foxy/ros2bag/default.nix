
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, launch-testing, launch-testing-ros, pythonPackages, ros2cli, rosbag2-transport }:
buildRosPackage {
  pname = "ros-foxy-ros2bag";
  version = "0.3.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag2-release";
    rev = "2d452321de91d0ef215d000afeece39c8dda5530";
    owner = "ros2-gbp";
    sha256 = "sha256-dSkAG1ghaj9t3OnFof+eCMU2SOjqRsHr7qNrHwFJv8g=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch-testing launch-testing-ros pythonPackages.pytest ];
  propagatedBuildInputs = [ ros2cli rosbag2-transport ];

  meta = {
    description = ''Entry point for rosbag in ROS 2'';
    license = with lib.licenses; [ asl20 ];
  };
}
