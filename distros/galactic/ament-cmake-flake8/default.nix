
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-copyright, ament-cmake-core, ament-cmake-lint-cmake, ament-cmake-test, ament-flake8 }:
buildRosPackage {
  pname = "ros-galactic-ament-cmake-flake8";
  version = "0.10.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_lint-release";
    rev = "2d80d39fd916a0f9c09549b2e2a0d086fe9f055d";
    owner = "ros2-gbp";
    sha256 = "sha256-HaFjrQ/uedc0dQEGXmdhjevRGLsfbqLVdmLPde2Viaw=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-core ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  propagatedBuildInputs = [ ament-cmake-test ament-flake8 ];
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-flake8 ];

  meta = {
    description = ''The CMake API for ament_flake8 to check code syntax and style conventions
    with flake8.'';
    license = with lib.licenses; [ asl20 ];
  };
}
