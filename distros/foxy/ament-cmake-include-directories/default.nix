
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core }:
buildRosPackage {
  pname = "ros-foxy-ament-cmake-include-directories";
  version = "0.9.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_cmake-release";
    rev = "40bc062e84c50686ab51c3ad8d1301248b7ae751";
    owner = "ros2-gbp";
    sha256 = "sha256-QSeuv7QQnkgym0WtI3uzTgSCdeLtS6UkLQ/GnuTwIiM=";
  };

  buildType = "ament_cmake";
  propagatedBuildInputs = [ ament-cmake-core ];
  nativeBuildInputs = [ ament-cmake-core ];

  meta = {
    description = ''The functionality to order include directories according to a chain of prefixes in the ament buildsystem in CMake.'';
    license = with lib.licenses; [ asl20 ];
  };
}
