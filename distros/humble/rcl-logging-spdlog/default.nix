
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-ros, ament-lint-auto, ament-lint-common, performance-test-fixture, rcl-logging-interface, rcpputils, rcutils, spdlog, spdlog-vendor }:
buildRosPackage {
  pname = "ros-humble-rcl-logging-spdlog";
  version = "2.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rcl_logging-release";
    rev = "de9bb38d1f12fbcdbd476ad54a86449bb29d2e5f";
    owner = "ros2-gbp";
    sha256 = "sha256-mdIICS8v4njC0+FRKpzz93HaVZmfalZCUoIdUnGbgJ8=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common performance-test-fixture ];
  propagatedBuildInputs = [ rcl-logging-interface rcpputils rcutils spdlog spdlog-vendor ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''Implementation of rcl_logging API for an spdlog backend.'';
    license = with lib.licenses; [ asl20 ];
  };
}
