
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, hls-lfcd-lds-driver, nav2-bringup, raspimouse, raspimouse-slam, rplidar-ros, rviz2, urg-node }:
buildRosPackage {
  pname = "ros-foxy-raspimouse-navigation";
  version = "1.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "raspimouse_slam_navigation_ros2-release";
    rev = "0d516e39073be45e38aa9b5d7e21ba31476238c3";
    owner = "ros2-gbp";
    sha256 = "sha256-VdAfQVkhne+yXvgBkK7QA6irGU9sWClofKiAd2I2jxQ=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ hls-lfcd-lds-driver nav2-bringup raspimouse raspimouse-slam rplidar-ros rviz2 urg-node ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Navigation package for Raspberry Pi Mouse'';
    license = with lib.licenses; [ asl20 ];
  };
}
