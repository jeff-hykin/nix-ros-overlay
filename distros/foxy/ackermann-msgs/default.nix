
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-common, rosidl-default-generators, rosidl-default-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-foxy-ackermann-msgs";
  version = "2.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ackermann_msgs-release";
    rev = "5bb2b83da16e56fa747fdcf6b9e3218ce7d00545";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-zn0jbHQ6PrAlpzAwpr3Tu01dOE8TVcs0XYlTXL0x8wg=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-common ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];

  meta = {
    description = ''ROS2 messages for robots using Ackermann steering.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
