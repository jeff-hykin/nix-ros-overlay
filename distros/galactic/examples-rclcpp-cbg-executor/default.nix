
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, rclcpp, std-msgs }:
buildRosPackage {
  pname = "ros-galactic-examples-rclcpp-cbg-executor";
  version = "0.11.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "examples-release";
    rev = "82e58997b0f7f818bcdd37d76dd4a39980646088";
    owner = "ros2-gbp";
    sha256 = "sha256-fxqqZ3d3Y2YADKtdoBtcegb43MZLiVv+6ktg2VIp5Fw=";
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
