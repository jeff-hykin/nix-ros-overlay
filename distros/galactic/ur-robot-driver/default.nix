
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-python, controller-manager, controller-manager-msgs, geometry-msgs, hardware-interface, launch-testing-ament-cmake, pluginlib, rclcpp, rclcpp-lifecycle, rclpy, std-msgs, std-srvs, tf2-geometry-msgs, ur-bringup, ur-client-library, ur-controllers, ur-dashboard-msgs, ur-description, ur-msgs }:
buildRosPackage {
  pname = "ros-galactic-ur-robot-driver";
  version = "2.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "Universal_Robots_ROS2_Driver-release";
    rev = "efa7a0d25d55ce99a58006940f7f3293ec55cb77";
    owner = "ros2-gbp";
    sha256 = "sha256-IeVTHCiztXiBFth2fUeUCQmh/U7X3360JQBPYWiXYfM=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ament-cmake-python ];
  checkInputs = [ launch-testing-ament-cmake ];
  propagatedBuildInputs = [ controller-manager controller-manager-msgs geometry-msgs hardware-interface pluginlib rclcpp rclcpp-lifecycle rclpy std-msgs std-srvs tf2-geometry-msgs ur-bringup ur-client-library ur-controllers ur-dashboard-msgs ur-description ur-msgs ];
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];

  meta = {
    description = ''The new driver for Universal Robots UR3, UR5 and UR10 robots with CB3 controllers and the e-series.'';
    license = with lib.licenses; [ bsd3 ];
  };
}
