
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-clang-format, ament-cmake-copyright, ament-cmake-flake8, ament-cmake-gtest, ament-cmake-lint-cmake, ament-cmake-pep257, ament-cmake-xmllint, ament-lint-auto, boost, controller-interface, diagnostic-msgs, diagnostic-updater, dynamixel-sdk, hardware-interface, pluginlib, rclcpp, realtime-tools, robot-state-publisher, ros2-control, xacro }:
buildRosPackage {
  pname = "ros-foxy-dynamixel-hardware-interface";
  version = "0.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dynamixel_hardware_interface-release";
    rev = "1b2d3db39a1ff0ad9cd2526f8a94fd17c0822a42";
    owner = "OUXT-Polaris";
    sha256 = "sha256-TZaD24csWqVynyvlonxW6ke5n5VIn4uXo+YQDcbal4A=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-copyright ament-cmake-flake8 ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-xmllint ament-lint-auto ];
  propagatedBuildInputs = [ boost controller-interface diagnostic-msgs diagnostic-updater dynamixel-sdk hardware-interface pluginlib rclcpp realtime-tools robot-state-publisher ros2-control xacro ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Hardware Interface and controllers for dynamixel motors'';
    license = with lib.licenses; [ asl20 ];
  };
}
