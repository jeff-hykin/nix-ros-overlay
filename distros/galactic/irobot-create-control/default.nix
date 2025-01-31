
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-flake8, ament-cmake-lint-cmake, ament-cmake-pep257, ament-cmake-xmllint, ament-lint-auto, joint-state-broadcaster, ros2-controllers, ros2launch }:
buildRosPackage {
  pname = "ros-galactic-irobot-create-control";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "create3_sim-release";
    rev = "557cc2b774171ea8707dbd2c98802de8e42295cb";
    owner = "ros2-gbp";
    sha256 = "sha256-DUURJrcF4xGao67G+dTvdxnJKOsDMpXFig49PQGKftc=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-xmllint ament-lint-auto ];
  propagatedBuildInputs = [ joint-state-broadcaster ros2-controllers ros2launch ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Provides the diff-drive controller for the iRobot(R) Create(R) 3 Educational Robot.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
