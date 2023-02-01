
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, irobot-create-msgs, pythonPackages, rclpy, turtlebot4-navigation }:
buildRosPackage {
  pname = "ros-galactic-turtlebot4-python-tutorials";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot4_tutorials-release";
    rev = "220f491e614dbf9f653e2fac907b6de7aeffef02";
    owner = "ros2-gbp";
    sha256 = "sha256-ar7oCCHCRb/cWZ5tbnxrZbsXJIjvdhTMDUmWem43x40=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ irobot-create-msgs rclpy turtlebot4-navigation ];

  meta = {
    description = ''TurtleBot 4 Python Tutorials'';
    license = with lib.licenses; [ asl20 ];
  };
}
