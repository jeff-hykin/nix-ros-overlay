
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, example-interfaces, rclcpp, rclcpp-action }:
buildRosPackage {
  pname = "ros-foxy-examples-rclcpp-minimal-action-server";
  version = "0.9.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "examples-release";
    rev = "5704ec9dd4a525d71aabd590e914b2c2ab94cf1d";
    owner = "ros2-gbp";
    sha256 = "sha256-vmK//RgC25K6K3gK8a9/pBgBT+Hejs3nPqT/5aTS/dU=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-action ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Minimal action server examples'';
    license = with lib.licenses; [ asl20 ];
  };
}
