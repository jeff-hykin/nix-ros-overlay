
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-python, ament-lint-auto, ament-lint-common, builtin-interfaces, class-loader, compressed-depth-image-transport, compressed-image-transport, cv-bridge, geometry-msgs, image-geometry, image-transport, laser-geometry, message-filters, nav-msgs, nav2-common, nav2-msgs, octomap, octomap-msgs, pcl, pcl-conversions, pluginlib, rclcpp, rclcpp-components, rclpy, ros-environment, rosgraph-msgs, rosidl-default-generators, rosidl-default-runtime, rtabmap, rviz-common, rviz-default-plugins, rviz-rendering, sensor-msgs, std-msgs, std-srvs, stereo-msgs, tf2, tf2-eigen, tf2-geometry-msgs, tf2-ros, visualization-msgs }:
buildRosPackage {
  pname = "ros-humble-rtabmap-ros";
  version = "0.20.22-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rtabmap_ros-release";
    rev = "0f807b0a0368cd846b040ad074fd5e1e7162e27d";
    owner = "introlab";
    sha256 = "sha256-ASf2TsLhTW+nWZfOMxsgZ0mGwkJbxrPhb3aguTbu28c=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ament-cmake-python pcl ros-environment rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ builtin-interfaces class-loader compressed-depth-image-transport compressed-image-transport cv-bridge geometry-msgs image-geometry image-transport laser-geometry message-filters nav-msgs nav2-common nav2-msgs octomap octomap-msgs pcl-conversions pluginlib rclcpp rclcpp-components rclpy rosgraph-msgs rosidl-default-runtime rtabmap rviz-common rviz-default-plugins rviz-rendering sensor-msgs std-msgs std-srvs stereo-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ];
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];

  meta = {
    description = ''RTAB-Map's ros-pkg. RTAB-Map is a RGB-D SLAM approach with real-time constraints.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
