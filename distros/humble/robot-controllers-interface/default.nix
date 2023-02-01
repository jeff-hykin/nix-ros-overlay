
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-cpplint, pluginlib, rclcpp, rclcpp-action, robot-controllers-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-humble-robot-controllers-interface";
  version = "0.9.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_controllers-ros2-release";
    rev = "cc21bd5f5f6dc30ab6976b287807fd447a3b9a61";
    owner = "fetchrobotics-gbp";
    sha256 = "sha256-RnV2xz0xdp3ejwJr9rHTKXhBc3FzfCEHIJwGwqrNZ7o=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-cpplint ];
  propagatedBuildInputs = [ pluginlib rclcpp rclcpp-action robot-controllers-msgs tf2-ros ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Generic framework for robot controls.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
