
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, builtin-interfaces, rosidl-default-generators, rosidl-default-runtime }:
buildRosPackage {
  pname = "ros-foxy-rover-msgs";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roverrobotics_ros2-release";
    rev = "77e9e45e95e682e9a73e40c8da0beb9facb2ba72";
    owner = "RoverRobotics-release";
    sha256 = "sha256-Z4AtoiiR7om6ktKbQ0H2yJNeWxR16Fyfj8dr0EHNxhc=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Messages for communicating with a Rover Pro.'';
    license = with lib.licenses; [ bsd3 ];
  };
}
