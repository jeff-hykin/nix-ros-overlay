
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, cartographer, cartographer-ros-msgs, eigen, libyamlcpp, lua5, nav-msgs, pcl, pcl-conversions, rclcpp, sensor-msgs, tf2, tf2-eigen, tf2-msgs, tf2-ros, urdfdom-headers, visualization-msgs }:
buildRosPackage {
  pname = "ros-galactic-cartographer-ros";
  version = "1.0.9003-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cartographer_ros-release";
    rev = "07bb6a6fa729e519d84dcdcb7e7187c0704bbdd6";
    owner = "ros2-gbp";
    sha256 = "sha256-bmWPvRd3or0c6ZlgCfBfJgHxF3/VmHMgFHt2Fx+Wa3M=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake eigen pcl-conversions tf2-eigen urdfdom-headers ];
  propagatedBuildInputs = [ cartographer cartographer-ros-msgs libyamlcpp lua5 nav-msgs pcl rclcpp sensor-msgs tf2 tf2-msgs tf2-ros visualization-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Cartographer is a system that provides real-time simultaneous localization
    and mapping (SLAM) in 2D and 3D across multiple platforms and sensor
    configurations. This package provides Cartographer's ROS integration.'';
    license = with lib.licenses; [ asl20 ];
  };
}
