
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, camera-info-manager, diagnostic-msgs, diagnostic-updater, image-proc, image-transport, message-filters, rclcpp, rclcpp-components, sensor-msgs, std-msgs, stereo-image-proc }:
buildRosPackage {
  pname = "ros-humble-avt-vimba-camera";
  version = "2001.1.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "avt_vimba_camera-release";
    rev = "98269e9716399c2d996f6dedfd1cd2d1dac97b03";
    owner = "ros2-gbp";
    sha256 = "sha256-b1YFGg6j0b9K0ewtxAKbcnT1um/8yTIj7XIIbEChDbY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ camera-info-manager diagnostic-msgs diagnostic-updater image-proc image-transport message-filters rclcpp rclcpp-components sensor-msgs std-msgs stereo-image-proc ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''Camera driver for Allied Vision Technologies (AVT) cameras, based on their Vimba SDK.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
