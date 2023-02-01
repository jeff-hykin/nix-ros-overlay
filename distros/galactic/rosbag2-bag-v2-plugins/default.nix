
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gmock, ament-lint-auto, ament-lint-common, class-loader, pluginlib, rclcpp, rcutils, ros1-bridge, ros1-rosbag-storage-vendor, rosbag2, rosbag2-storage, rosbag2-test-common, rosbag2-transport, std-msgs }:
buildRosPackage {
  pname = "ros-galactic-rosbag2-bag-v2-plugins";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag2_bag_v2-release";
    rev = "ad232f1b7a53e8aecf44e06174196e2d032c0aaa";
    owner = "ros2-gbp";
    sha256 = "sha256-kQTlxCxm2jAzNUA05GCioen0Mehs4ze7NRURFGxsx58=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rosbag2-test-common rosbag2-transport std-msgs ];
  propagatedBuildInputs = [ class-loader pluginlib rclcpp rcutils ros1-bridge ros1-rosbag-storage-vendor rosbag2 rosbag2-storage ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Package containing storage and converter plugins for rosbag 1'';
    license = with lib.licenses; [ asl20 ];
  };
}
