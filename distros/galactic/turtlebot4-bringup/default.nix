
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, depthai-bridge, depthai-examples, depthai-ros-msgs, joy-linux, rplidar-ros, teleop-twist-joy, tf2-ros, turtlebot4-description, turtlebot4-diagnostics, turtlebot4-node }:
buildRosPackage {
  pname = "ros-galactic-turtlebot4-bringup";
  version = "0.1.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot4_robot-release";
    rev = "b4fc5d1f6832357ec8a82f94974da3bf04e69ff7";
    owner = "ros2-gbp";
    sha256 = "sha256-KXhwiP5THSx6xjpvJ8eNndODPDZsC8J9GCYZz7YBnb4=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ depthai-bridge depthai-examples depthai-ros-msgs joy-linux rplidar-ros teleop-twist-joy tf2-ros turtlebot4-description turtlebot4-diagnostics turtlebot4-node ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Turtlebot4 Robot Bringup'';
    license = with lib.licenses; [ asl20 ];
  };
}
