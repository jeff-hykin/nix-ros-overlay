
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core }:
buildRosPackage {
  pname = "ros-rolling-ament-acceleration";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_acceleration-release";
    rev = "478de798c017482ed511696350b109bf945e4e6c";
    owner = "ros2-gbp";
    sha256 = "sha256-tnkilfsTlrhC8xcFlu9E8VIt8hGsNKCcdD53KV8JRac=";
  };

  buildType = "ament_cmake";
  propagatedBuildInputs = [ ament-cmake-core ];
  nativeBuildInputs = [ ament-cmake-core ];

  meta = {
    description = ''CMake macros and utilities to include hardware acceleration into the ROS 2 build system (ament) and its development flows.'';
    license = with lib.licenses; [ asl20 ];
  };
}
