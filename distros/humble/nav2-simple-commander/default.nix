
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, action-msgs, ament-copyright, ament-flake8, ament-pep257, geometry-msgs, lifecycle-msgs, nav2-msgs, pythonPackages, rclpy }:
buildRosPackage {
  pname = "ros-humble-nav2-simple-commander";
  version = "1.1.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation2-release";
    rev = "05b5f6723f207f19f6f9e904ec565e033ac9c0ea";
    owner = "SteveMacenski";
    sha256 = "sha256-pvdtjQAh7db4Jc8b93XYMBSOkxSZKIAmZrsf02O671Y=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ action-msgs geometry-msgs lifecycle-msgs nav2-msgs rclpy ];

  meta = {
    description = ''An importable library for writing mobile robot applications in python3'';
    license = with lib.licenses; [ asl20 ];
  };
}
