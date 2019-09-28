
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, pythonPackages, ament-flake8, ament-pep257 }:
buildRosPackage {
  pname = "ros-dashing-ament-lint-cmake";
  version = "0.7.10-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/ament_lint-release/archive/release/dashing/ament_lint_cmake/0.7.10-1.tar.gz";
    name = "0.7.10-1.tar.gz";
    sha256 = "a8a3766fd2db21378578e1d8e7a255ecb579d1ca1312bd21e074ac20698f405f";
  };

  buildType = "ament_python";
  checkInputs = [ ament-flake8 ament-copyright pythonPackages.pytest ament-pep257 ];

  meta = {
    description = ''The ability to lint CMake code using cmakelint and generate xUnit test
    result files.'';
    license = with lib.licenses; [ asl20 ];
  };
}