
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, pythonPackages, rclpy }:
buildRosPackage {
  pname = "ros-humble-examples-rclpy-guard-conditions";
  version = "0.15.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "examples-release";
    rev = "845b444c0a76d4f2d60225f4689410d68986ff07";
    owner = "ros2-gbp";
    sha256 = "sha256-HEAm7jj9mLIwutmfaBtaW8q9ScDEshtr56iwDSQtST4=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ rclpy ];

  meta = {
    description = ''Examples of using guard conditions.'';
    license = with lib.licenses; [ asl20 ];
  };
}
