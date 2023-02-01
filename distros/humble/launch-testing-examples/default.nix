
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, demo-nodes-cpp, launch, launch-ros, launch-testing, launch-testing-ros, pythonPackages, rclpy, ros2bag, rosbag2-transport, std-msgs }:
buildRosPackage {
  pname = "ros-humble-launch-testing-examples";
  version = "0.15.1-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "ros2-gbp";
        repo = "examples-release";
        rev = "release/humble/launch_testing_examples/0.15.1-1";
        sha256 = "sha256-p3vlS69VFPZsIW9Vr5LxkDfjQsnNjdxp4r+C/dgpj0c=";
      };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 demo-nodes-cpp launch launch-ros launch-testing launch-testing-ros pythonPackages.pytest rclpy ros2bag rosbag2-transport std-msgs ];

  meta = {
    description = ''Examples of simple launch tests'';
    license = with lib.licenses; [ asl20 ];
  };
}
