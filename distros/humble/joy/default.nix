
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-ros, ament-lint-auto, ament-lint-common, rclcpp, rclcpp-components, sdl2-vendor, sensor-msgs }:
buildRosPackage {
  pname = "ros-humble-joy";
  version = "3.1.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "joystick_drivers-release";
    rev = "dadf0aaab663d99f2d710ee30bd83182debf5430";
    owner = "ros2-gbp";
    sha256 = "sha256-LVq01bvfmA7TdJQjbrFwa17MdoQoTZj+fMTxjgRHsHY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ rclcpp rclcpp-components sdl2-vendor sensor-msgs ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''The joy package contains joy_node, a node that interfaces a
    generic joystick to ROS 2. This node publishes a &quot;Joy&quot;
    message, which contains the current state of each one of the
    joystick's buttons and axes.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
