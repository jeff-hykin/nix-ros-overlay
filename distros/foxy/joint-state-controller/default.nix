
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gmock, controller-manager, hardware-interface, joint-state-broadcaster, pluginlib, rclcpp, ros2-control-test-assets }:
buildRosPackage {
  pname = "ros-foxy-joint-state-controller";
  version = "0.8.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros2_controllers-release";
    rev = "075b5659e5361354e458330233410c377ebed421";
    owner = "ros2-gbp";
    sha256 = "sha256-i90dUpYaHBwrHRfsqf0IMnXHccyRC1RCQaR55/KAqDA=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake pluginlib ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface rclcpp ros2-control-test-assets ];
  propagatedBuildInputs = [ joint-state-broadcaster ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Controller to publish joint state'';
    license = with lib.licenses; [ asl20 ];
  };
}
