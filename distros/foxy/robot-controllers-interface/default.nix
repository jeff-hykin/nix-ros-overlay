
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-cpplint, pluginlib, rclcpp, rclcpp-action, robot-controllers-msgs }:
buildRosPackage {
  pname = "ros-foxy-robot-controllers-interface";
  version = "0.8.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_controllers-ros2-release";
    rev = "b730b2e37ee8c874617a772b87394b1d3a2d0eb4";
    owner = "fetchrobotics-gbp";
    sha256 = "sha256-9mHPtMaKJvMwpAGr/u2cBP40bC7Tl7xA8lTKwnirR0E=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-cpplint ];
  propagatedBuildInputs = [ pluginlib rclcpp rclcpp-action robot-controllers-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Generic framework for robot controls.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
