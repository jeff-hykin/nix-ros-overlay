
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, launch-ros, rclcpp, rclcpp-components, realsense2-camera-msgs, xacro }:
buildRosPackage {
  pname = "ros-humble-realsense2-description";
  version = "4.51.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "realsense-ros-release";
    rev = "3df3a735bd5f405ad518c370a3c613cdc40a3663";
    owner = "IntelRealSense";
    sha256 = "sha256-7xl3PXh5S904NsGFLRSC121dwycHugAR8VcHIP0yvXE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ launch-ros rclcpp rclcpp-components realsense2-camera-msgs xacro ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''RealSense description package for Intel 3D D400 cameras'';
    license = with lib.licenses; [ asl20 ];
  };
}
