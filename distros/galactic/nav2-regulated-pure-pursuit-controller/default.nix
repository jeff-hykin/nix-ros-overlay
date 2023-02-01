
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-lint-auto, ament-lint-common, geometry-msgs, nav2-common, nav2-core, nav2-costmap-2d, nav2-msgs, nav2-util, pluginlib, rclcpp, tf2 }:
buildRosPackage {
  pname = "ros-galactic-nav2-regulated-pure-pursuit-controller";
  version = "1.0.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation2-release";
    rev = "1b86efe0860c35db085cd7a44631d881e5d3fbac";
    owner = "SteveMacenski";
    sha256 = "sha256-4jMND9IvfN9DgPcdElC1ya2kK9+yQjuTQPELQ835K1s=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp tf2 ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Regulated Pure Pursuit Controller'';
    license = with lib.licenses; [ asl20 ];
  };
}
