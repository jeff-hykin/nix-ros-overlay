
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, python3Packages, pythonPackages, rclpy, sensor-msgs, sensor-msgs-py, std-msgs }:
buildRosPackage {
  pname = "ros-galactic-examples-rclpy-pointcloud-publisher";
  version = "0.11.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "examples-release";
    rev = "4e897cb606064fb701bade3b4d18e3d6c2ddeaef";
    owner = "ros2-gbp";
    sha256 = "sha256-5Hsval0OVRXaZVkV8EHNnhb5lroOp4k27mtRngfqFvg=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ python3Packages.numpy rclpy sensor-msgs sensor-msgs-py std-msgs ];

  meta = {
    description = ''Example on how to publish a Pointcloud2 message'';
    license = with lib.licenses; [ asl20 ];
  };
}
