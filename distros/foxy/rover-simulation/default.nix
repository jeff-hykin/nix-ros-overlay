
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, rover-bringup, rover-navigation }:
buildRosPackage {
  pname = "ros-foxy-rover-simulation";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roverrobotics_ros2-release";
    rev = "3d88c8beb291463f4d3e23c10c05cb9fbbd1ddb5";
    owner = "RoverRobotics-release";
    sha256 = "sha256-89scNdcIIIG4UGOqPAwpoagcyf7Ibq4wljOnhDFqgB4=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ rover-bringup rover-navigation ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Launch files for Rover Simulation'';
    license = with lib.licenses; [ bsd3 ];
  };
}
