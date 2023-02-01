
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, rclcpp, std-msgs }:
buildRosPackage {
  pname = "ros-humble-examples-rclcpp-cbg-executor";
  version = "0.15.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "examples-release";
    rev = "2e99dc73c941ab556666554d2dd7e1ef6a4d2e98";
    owner = "ros2-gbp";
    sha256 = "sha256-uZCLXZuMFPvw8m06DCw6rKQ2BRRjssncqnqW/3T+n0I=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ rclcpp std-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Example for multiple Executor instances in one process, using the callback-group-level interface of the Executor class.'';
    license = with lib.licenses; [ asl20 ];
  };
}
