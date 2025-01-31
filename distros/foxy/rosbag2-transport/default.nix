
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-gmock, ament-cmake-ros, ament-index-cpp, ament-lint-auto, ament-lint-common, python-cmake-module, rclcpp, rmw, rmw-implementation-cmake, rosbag2-compression, rosbag2-cpp, rosbag2-storage, rosbag2-test-common, rpyutils, shared-queues-vendor, test-msgs, yaml-cpp-vendor }:
buildRosPackage {
  pname = "ros-foxy-rosbag2-transport";
  version = "0.3.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag2-release";
    rev = "9e25f5d0f6eaf767c6470201753790bc66d1751d";
    owner = "ros2-gbp";
    sha256 = "sha256-/kz7/6RfE3Sli4Ah9p8us4tzsB77SIK+M0cpJNDfcnk=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros ];
  checkInputs = [ ament-cmake-gmock ament-index-cpp ament-lint-auto ament-lint-common rmw-implementation-cmake rosbag2-test-common test-msgs ];
  propagatedBuildInputs = [ python-cmake-module rclcpp rmw rosbag2-compression rosbag2-cpp rosbag2-storage rpyutils shared-queues-vendor yaml-cpp-vendor ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''Layer encapsulating ROS middleware to allow rosbag2 to be used with or without middleware'';
    license = with lib.licenses; [ asl20 ];
  };
}
