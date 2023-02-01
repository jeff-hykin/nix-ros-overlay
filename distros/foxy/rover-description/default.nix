
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, urdf }:
buildRosPackage {
  pname = "ros-foxy-rover-description";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roverrobotics_ros2-release";
    rev = "31ddad382c4c2408c5d6b6ac4c202a27d15522ad";
    owner = "RoverRobotics-release";
    sha256 = "sha256-p7EDH+qtVX9jDzJ/IumY3F1OPk+fqRbE8cuCbxfUGHY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ urdf ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''URDF description of Rover.'';
    license = with lib.licenses; [ bsd3 ];
  };
}
