
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-cmake-mypy, ament-cmake-pytest, ament-lint-auto, ament-lint-common, launch-ros, lifecycle-msgs, pkg-config, python3Packages, pythonPackages, rclcpp, rclcpp-lifecycle, std-msgs, std-srvs, tracetools, tracetools-launch, tracetools-read }:
buildRosPackage {
  pname = "ros-galactic-tracetools-test";
  version = "2.3.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros2_tracing-release";
    rev = "977bf5f57010773fcc62f2b4135c182d695b338b";
    owner = "ros2-gbp";
    sha256 = "sha256-49PRe+JQln/6PNJg/WgTHdCA8EfHWWGpDNBfhIigJ9s=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake pkg-config ];
  checkInputs = [ ament-cmake-gtest ament-cmake-mypy ament-cmake-pytest ament-lint-auto ament-lint-common launch-ros python3Packages.pytestcov pythonPackages.pytest tracetools tracetools-launch tracetools-read ];
  propagatedBuildInputs = [ lifecycle-msgs rclcpp rclcpp-lifecycle std-msgs std-srvs ];
  nativeBuildInputs = [ ament-cmake pkg-config ];

  meta = {
    description = ''Testing utilities and tests for the tracetools package.'';
    license = with lib.licenses; [ asl20 ];
  };
}
