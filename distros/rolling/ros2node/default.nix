
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, ament-xmllint, launch, launch-ros, launch-testing, launch-testing-ros, python3Packages, pythonPackages, rclpy, ros2cli, test-msgs }:
buildRosPackage {
  pname = "ros-rolling-ros2node";
  version = "0.21.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros2cli-release";
    rev = "e79e65a9e144479f74dd817a39fffaa50ddc6555";
    owner = "ros2-gbp";
    sha256 = "sha256-gp979VdXZ9/q3FeC3UGuaXuxAj7Eg6i4S58yVNwNELw=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros python3Packages.pytest-timeout pythonPackages.pytest rclpy test-msgs ];
  propagatedBuildInputs = [ ros2cli ];

  meta = {
    description = ''The node command for ROS 2 command line tools.'';
    license = with lib.licenses; [ asl20 ];
  };
}
