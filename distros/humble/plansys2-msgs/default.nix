
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, action-msgs, ament-cmake, builtin-interfaces, rclcpp, rosidl-default-generators, std-msgs }:
buildRosPackage {
  pname = "ros-humble-plansys2-msgs";
  version = "2.0.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros2_planning_system-release";
    rev = "80bc1aac9b81db21dd8ff1f7ed0c0dba51f84fc8";
    owner = "IntelligentRoboticsLabs";
    sha256 = "sha256-hknUk8JuraiESL3Xgo8iGU7fJnIp64LcXoAhwW2e1IY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rclcpp rosidl-default-generators std-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Messages and service files for the ROS2 Planning System'';
    license = with lib.licenses; [ asl20 ];
  };
}
