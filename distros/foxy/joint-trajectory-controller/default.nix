
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, angles, control-msgs, controller-interface, controller-manager, hardware-interface, pluginlib, rclcpp, rclcpp-lifecycle, realtime-tools, ros2-control-test-assets, trajectory-msgs }:
buildRosPackage {
  pname = "ros-foxy-joint-trajectory-controller";
  version = "0.8.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros2_controllers-release";
    rev = "ce5e8049b08a3fe760913faf983e3fd067aa4354";
    owner = "ros2-gbp";
    sha256 = "sha256-GL9oT45ZMXNXC1jx55drYbJAJCLTdvkfxILkERRgaso=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest controller-manager ros2-control-test-assets ];
  propagatedBuildInputs = [ angles control-msgs controller-interface hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools trajectory-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Controller for executing joint-space trajectories on a group of joints'';
    license = with lib.licenses; [ asl20 ];
  };
}
