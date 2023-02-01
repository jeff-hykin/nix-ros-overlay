
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-gtest, ament-cmake-ros, rclcpp, ros2-socketcan }:
buildRosPackage {
  pname = "ros-humble-dataspeed-dbw-common";
  version = "2.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dbw_ros-release";
    rev = "00f6c2415e7adc9f0bee8206078fe0a8d615d180";
    owner = "DataspeedInc-release";
    sha256 = "sha256-hCjnKGUqP7DSU1gLfhxu2pPx1KTQ8+sV9I+SevrUnqY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros ];
  checkInputs = [ ament-cmake-gtest ];
  propagatedBuildInputs = [ rclcpp ros2-socketcan ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''Common interfaces for drive-by-wire.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
