
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-auto, gazebo-msgs, gazebo-ros, rclcpp }:
buildRosPackage {
  pname = "ros-foxy-pal-gazebo-worlds";
  version = "3.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pal_gazebo_worlds-ros2-release";
    rev = "f5f0902bd41d51ed8ab1320e1d6b62696cc9527b";
    owner = "pal-gbp";
    sha256 = "sha256-esU3pv3zI59rrioXrYePD3rZO8IxF9CZF/lc1Od3vYQ=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ament-cmake-auto ];
  propagatedBuildInputs = [ gazebo-msgs gazebo-ros rclcpp ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Simulation worlds for PAL robots.'';
    license = with lib.licenses; [ "LGPL-3.0" ];
  };
}
