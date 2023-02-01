
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, turtlebot4-base, turtlebot4-bringup, turtlebot4-diagnostics, turtlebot4-tests }:
buildRosPackage {
  pname = "ros-galactic-turtlebot4-robot";
  version = "0.1.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot4_robot-release";
    rev = "338f8f0d341254fcd396fd85ae345cea6a9c9815";
    owner = "ros2-gbp";
    sha256 = "sha256-Nw1CyeXt/K2e08UTeisLzvM8L+wwluEM7Tp+1cnU4iM=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot4-base turtlebot4-bringup turtlebot4-diagnostics turtlebot4-tests ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Turtlebot4 Robot Metapackage'';
    license = with lib.licenses; [ asl20 ];
  };
}
