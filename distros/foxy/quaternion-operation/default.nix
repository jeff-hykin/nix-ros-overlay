
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-auto, ament-cmake-gtest, ament-lint-auto, eigen, geometry-msgs, ouxt-lint-common, rclcpp, tf2-ros }:
buildRosPackage {
  pname = "ros-foxy-quaternion-operation";
  version = "0.0.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "quaternion_operation-release";
    rev = "9c5299aec639330b8401242ef1e226ee88eb7298";
    owner = "OUXT-Polaris";
    sha256 = "sha256-XFIOq/J1ybBjdR5TFUumOgHlYUH5o2Mcm9zh1zPijKo=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ouxt-lint-common ];
  propagatedBuildInputs = [ ament-cmake-auto eigen geometry-msgs rclcpp tf2-ros ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''The quaternion_operation package'';
    license = with lib.licenses; [ asl20 ];
  };
}
