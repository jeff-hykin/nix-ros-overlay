
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-cppcheck, ament-cmake-cpplint, ament-cmake-flake8, ament-cmake-gmock, ament-cmake-gtest, ament-cmake-pep257, ament-cmake-uncrustify, ament-lint-auto, launch, launch-system-modes, rclcpp, rclcpp-lifecycle, ros2launch, system-modes, system-modes-msgs }:
buildRosPackage {
  pname = "ros-rolling-system-modes-examples";
  version = "0.9.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "system_modes-release";
    rev = "f7a1e2573427e0baefd521b21b377cb356bbb69a";
    owner = "ros2-gbp";
    sha256 = "sha256-0kfAi8ExAnUicuzTFtWKNQwRZP8qipcdbz4XUrg7EQM=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-gmock ament-cmake-gtest ament-cmake-pep257 ament-cmake-uncrustify ament-lint-auto ];
  propagatedBuildInputs = [ launch launch-system-modes rclcpp rclcpp-lifecycle ros2launch system-modes system-modes-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Example systems and according launch files for the system_modes
    package.'';
    license = with lib.licenses; [ asl20 ];
  };
}
