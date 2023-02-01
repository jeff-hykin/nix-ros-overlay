
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, geometry-msgs, launch-xml, marvelmind-ros2-msgs, rclcpp, std-msgs }:
buildRosPackage {
  pname = "ros-humble-marvelmind-ros2";
  version = "1.0.3-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "marvelmind_ros2_release_repo";
    rev = "f5243153674e8b6436ce782132324c20f7749a9a";
    owner = "MarvelmindRobotics";
    sha256 = "sha256-y3ZRvRsPpSKa+ONhSFIzX4WMfAGM/ovH9duWiEKTk0I=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ geometry-msgs launch-xml marvelmind-ros2-msgs rclcpp std-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Marvelmind ROS2 package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
