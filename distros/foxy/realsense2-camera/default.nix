
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, builtin-interfaces, cv-bridge, diagnostic-updater, eigen, geometry-msgs, image-transport, launch-ros, librealsense2, nav-msgs, rclcpp, rclcpp-components, realsense2-camera-msgs, ros-environment, sensor-msgs, std-msgs, tf2, tf2-ros }:
buildRosPackage {
  pname = "ros-foxy-realsense2-camera";
  version = "4.51.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "realsense-ros-release";
    rev = "1df3e57265c2c1da76fc8770adfd29a09c734b05";
    owner = "IntelRealSense";
    sha256 = "sha256-O/ta/1y9TxZ4fnhsBw20dq7eCrtG+nuRaN35kbJx2dc=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ros-environment ];
  propagatedBuildInputs = [ builtin-interfaces cv-bridge diagnostic-updater eigen geometry-msgs image-transport launch-ros librealsense2 nav-msgs rclcpp rclcpp-components realsense2-camera-msgs sensor-msgs std-msgs tf2 tf2-ros ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''RealSense camera package allowing access to Intel T265 Tracking module and SR300 and D400 3D cameras'';
    license = with lib.licenses; [ asl20 ];
  };
}
