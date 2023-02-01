
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, ignition, image-transport, pkg-config, rclcpp, ros-ign-bridge, sensor-msgs }:
buildRosPackage {
  pname = "ros-foxy-ros-ign-image";
  version = "0.221.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_ign-release";
    rev = "f46dd663816b5bd77560f70e5955fbb336b77f84";
    owner = "ros2-gbp";
    sha256 = "sha256-nRZySFkz13ZgEQsIH/WMLTkmiIJId/qjUsdeA3RaUDg=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake pkg-config ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ ignition.msgs5 ignition.transport8 image-transport rclcpp ros-ign-bridge sensor-msgs ];
  nativeBuildInputs = [ ament-cmake pkg-config ];

  meta = {
    description = ''Image utilities for Ignition simulation with ROS.'';
    license = with lib.licenses; [ asl20 ];
  };
}
