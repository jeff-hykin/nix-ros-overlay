
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, abseil-cpp, ament-cmake, builtin-interfaces, cartographer, cartographer-ros-msgs, eigen, geometry-msgs, gflags, glog, gtest, launch, nav-msgs, pcl, pcl-conversions, python3Packages, rclcpp, robot-state-publisher, rosbag2-cpp, rosbag2-storage, sensor-msgs, std-msgs, tf2, tf2-eigen, tf2-msgs, tf2-ros, urdf, visualization-msgs }:
buildRosPackage {
  pname = "ros-rolling-cartographer-ros";
  version = "2.0.9000-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cartographer_ros-release";
    rev = "41d69d7ba326eb0ce9bdcd561d8361b2dad9754c";
    owner = "ros2-gbp";
    sha256 = "sha256-4vheJuIJolPphYAtKyzlDmyyyP9klyIRg9+/ew1l9sY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake gtest python3Packages.sphinx ];
  propagatedBuildInputs = [ abseil-cpp builtin-interfaces cartographer cartographer-ros-msgs eigen geometry-msgs gflags glog launch nav-msgs pcl pcl-conversions rclcpp robot-state-publisher rosbag2-cpp rosbag2-storage sensor-msgs std-msgs tf2 tf2-eigen tf2-msgs tf2-ros urdf visualization-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Cartographer is a system that provides real-time simultaneous localization
    and mapping (SLAM) in 2D and 3D across multiple platforms and sensor
    configurations. This package provides Cartographer's ROS integration.'';
    license = with lib.licenses; [ asl20 ];
  };
}
