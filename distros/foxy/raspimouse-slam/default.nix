
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, hls-lfcd-lds-driver, joint-state-publisher, joy-linux, nav2-map-server, raspimouse, raspimouse-description, raspimouse-ros2-examples, robot-state-publisher, rplidar-ros, rviz2, slam-toolbox, urg-node, xacro }:
buildRosPackage {
  pname = "ros-foxy-raspimouse-slam";
  version = "1.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "raspimouse_slam_navigation_ros2-release";
    rev = "91f94f6af5a13d417a06e7913b43a9863ac38be2";
    owner = "ros2-gbp";
    sha256 = "sha256-cagNEf3XT1HxRZEFXC9Ucx0Bq6dvt2kWnKrgMg7dHow=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ hls-lfcd-lds-driver joint-state-publisher joy-linux nav2-map-server raspimouse raspimouse-description raspimouse-ros2-examples robot-state-publisher rplidar-ros rviz2 slam-toolbox urg-node xacro ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''SLAM package for Raspberry Pi Mouse'';
    license = with lib.licenses; [ asl20 ];
  };
}
