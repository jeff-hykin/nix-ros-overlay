
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, ament-lint-auto, ament-lint-common, rclpy }:
buildRosPackage {
  pname = "ros-humble-urdf-test";
  version = "2.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "urdf_test-ros2-gbp";
    rev = "87862d9c3fb663d9a208e176ee5bdb27035dd0f1";
    owner = "pal-gbp";
    sha256 = "sha256-ssrgEuCQG/OC0F3/tDO0Z7FEcsmbIQmETR5jVBKkBNc=";
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
