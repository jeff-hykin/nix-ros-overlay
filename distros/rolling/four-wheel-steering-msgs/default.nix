
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, rosidl-default-generators, rosidl-default-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-rolling-four-wheel-steering-msgs";
  version = "2.0.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "four_wheel_steering_msgs-release";
    rev = "2fd6e5e21956b83ead80f8fd50b1aca5d490fd85";
    owner = "ros2-gbp";
    sha256 = "sha256-lESkZ6d2jUSfCCCB5KsV8gJwBTO0EG7O4/LInYggSzc=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];

  meta = {
    description = ''ROS messages for robots using FourWheelSteering.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
