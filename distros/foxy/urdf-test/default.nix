
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, ament-lint-auto, ament-lint-common, rclpy }:
buildRosPackage {
  pname = "ros-foxy-urdf-test";
  version = "2.0.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "urdf_test-ros2-gbp";
    rev = "495a07a80f40205e559cc748f7a531ef0f85ab40";
    owner = "pal-gbp";
    sha256 = "sha256-S2fE06+KJ7DbPzRcxsfJLx/O3g8h/wEKPlGzJl+Ni58=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ rclpy ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''The urdf_test package'';
    license = with lib.licenses; [ asl20 ];
  };
}
