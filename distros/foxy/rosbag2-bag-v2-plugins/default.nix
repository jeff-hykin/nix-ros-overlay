
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gmock, ament-lint-auto, ament-lint-common, pluginlib, rclcpp, rcutils, ros1-bridge, ros1-rosbag-storage-vendor, rosbag2, rosbag2-storage, rosbag2-test-common, rosbag2-transport, shared-queues-vendor, std-msgs }:
buildRosPackage {
  pname = "ros-foxy-rosbag2-bag-v2-plugins";
  version = "0.0.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag2_bag_v2-release";
    rev = "15877a0fb11f48fe7b718b8e96e0155c383f9e56";
    owner = "ros2-gbp";
    sha256 = "sha256-KN0T03pV9V1GrMjmTmEFNdm5itUwY2FEJhNWoGaZsaA=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rosbag2-test-common rosbag2-transport shared-queues-vendor std-msgs ];
  propagatedBuildInputs = [ pluginlib rclcpp rcutils ros1-bridge ros1-rosbag-storage-vendor rosbag2 rosbag2-storage ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Package containing storage and converter plugins for rosbag 1'';
    license = with lib.licenses; [ asl20 ];
  };
}
