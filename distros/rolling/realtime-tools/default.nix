
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, rclcpp, rclcpp-action, test-msgs }:
buildRosPackage {
  pname = "ros-rolling-realtime-tools";
  version = "2.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "realtime_tools-release";
    rev = "5395a8fcb3d4bee7da06e020f201cb01a320c948";
    owner = "ros2-gbp";
    sha256 = "sha256-x4hpsIRPQ3clZ9n9aEo793BI+5NH9a78D+LLknga7Hc=";
  };

  buildType = "ament_cmake";
  checkInputs = [ rclcpp-action test-msgs ];
  propagatedBuildInputs = [ ament-cmake rclcpp rclcpp-action ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Contains a set of tools that can be used from a hard
    realtime thread, without breaking the realtime behavior.'';
    license = with lib.licenses; [ "3-Clause-BSD" ];
  };
}
