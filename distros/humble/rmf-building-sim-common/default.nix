
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, menge-vendor, rclcpp, rmf-building-map-msgs, rmf-door-msgs, rmf-lift-msgs }:
buildRosPackage {
  pname = "ros-humble-rmf-building-sim-common";
  version = "2.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_simulation-release";
    rev = "cc80986d3b486b9f2602fd8f3974bbb53e594934";
    owner = "ros2-gbp";
    sha256 = "sha256-m+erezYIgPF/6kubq+BP5hUVj/BzCSetD9APTjO/Kd0=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ menge-vendor rclcpp rmf-building-map-msgs rmf-door-msgs rmf-lift-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Common utility functions for Gazebo-classic and Gazebo building plugins'';
    license = with lib.licenses; [ asl20 ];
  };
}
