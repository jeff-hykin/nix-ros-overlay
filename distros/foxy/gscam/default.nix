
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-lint-auto, ament-lint-common, camera-calibration-parsers, camera-info-manager, class-loader, cv-bridge, gst_all_1, image-transport, rclcpp, rclcpp-components, sensor-msgs }:
buildRosPackage {
  pname = "ros-foxy-gscam";
  version = "2.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "gscam-release";
    rev = "00057238f07274b588b67e61bc933eff26045083";
    owner = "ros2-gbp";
    sha256 = "sha256-CKQzdZxZ6OZeWkirhmcrfJhb0hNN0vSimKIRHSUDT3k=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ camera-calibration-parsers camera-info-manager class-loader cv-bridge gst_all_1.gst-plugins-base gst_all_1.gstreamer image-transport rclcpp rclcpp-components sensor-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''A ROS camera driver that uses gstreamer to connect to
    devices such as webcams.'';
    license = with lib.licenses; [ "Apache-2.0-License" ];
  };
}
