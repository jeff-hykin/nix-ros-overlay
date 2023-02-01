
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, rqt-robot-monitor, rviz2, turtlebot4-description }:
buildRosPackage {
  pname = "ros-galactic-turtlebot4-viz";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot4_desktop-release";
    rev = "e5221065e38b17ef0c8186c3f31137b4b529fd76";
    owner = "ros2-gbp";
    sha256 = "sha256-eNWi6Wturt6a7FwvvuN2/KYBc4myenqXRSkXb9bhChk=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ rqt-robot-monitor rviz2 turtlebot4-description ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Visualization launchers and helpers for Turtlebot4'';
    license = with lib.licenses; [ asl20 ];
  };
}
