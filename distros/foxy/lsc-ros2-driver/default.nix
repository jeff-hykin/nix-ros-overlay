
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, diagnostic-updater, rclcpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-foxy-lsc-ros2-driver";
  version = "1.0.0-r10";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "lsc_ros2_driver-release";
    rev = "1116b457974070bb90413380aea9b3d098f6d8a6";
    owner = "AutonicsLiDAR-release";
    sha256 = "sha256-YhMew+QHLeT6uE6uwB1IcCwYfF0l0eFXUw5PDso0JtY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ diagnostic-updater rclcpp sensor-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''ROS2 driver package for Autonics LSC Series'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
