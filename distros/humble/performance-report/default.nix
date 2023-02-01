
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, chromium, performance-test, python3Packages, pythonPackages, rclpy }:
buildRosPackage {
  pname = "ros-humble-performance-report";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "performance_test-release";
    rev = "3cc9bf6a5d086f4afa0d2be642906704ec23f951";
    owner = "ros2-gbp";
    sha256 = "sha256-K8kp+Ooz10K66Yr+DMmbtb8BqbmZXIT2W6niWkfIJ7A=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 python3Packages.pyyaml pythonPackages.pytest ];
  propagatedBuildInputs = [ chromium performance-test python3Packages.pandas python3Packages.selenium rclpy ];

  meta = {
    description = ''Apex.AI performance_test runner, plotter, and reporter'';
    license = with lib.licenses; [ asl20 ];
  };
}
