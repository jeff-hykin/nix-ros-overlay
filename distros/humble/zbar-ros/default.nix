
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, cv-bridge, rclcpp, sensor-msgs, std-msgs, zbar }:
buildRosPackage {
  pname = "ros-humble-zbar-ros";
  version = "0.4.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "zbar_ros-release";
    rev = "421047f6655726702e882af3e0983fd1c22f09ea";
    owner = "ros2-gbp";
    sha256 = "sha256-JmBj10Hz3ZE/INAmcLBzMSkGG9axl7gNDMBMFvZr3sw=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ cv-bridge rclcpp sensor-msgs std-msgs zbar ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Lightweight ROS wrapper for Zbar barcode/qrcode reader library (http://zbar.sourceforge
    .net/)'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
