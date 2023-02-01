
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, ament-pycodestyle, pythonPackages, uncrustify-vendor }:
buildRosPackage {
  pname = "ros-rolling-ament-uncrustify";
  version = "0.13.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_lint-release";
    rev = "be03fe4ae730978ce11a3a619ffdb42386192790";
    owner = "ros2-gbp";
    sha256 = "sha256-Saoz9+u73OHSC4daIuXV7DPjkrHnGh1BwB6xAnnwW/4=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-pycodestyle pythonPackages.pytest ];
  propagatedBuildInputs = [ uncrustify-vendor ];

  meta = {
    description = ''The ability to check code against style conventions using uncrustify
    and generate xUnit test result files.'';
    license = with lib.licenses; [ asl20 ];
  };
}
