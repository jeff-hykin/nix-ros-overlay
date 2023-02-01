
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-gtest, ament-cmake-ros, launch-testing, openssl, rclcpp, rosidl-default-generators, rosidl-default-runtime }:
buildRosPackage {
  pname = "ros-foxy-rosauth";
  version = "2.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosauth-release";
    rev = "b643b4b02d431c37dd8aff08a4c8d261ae2999d7";
    owner = "ros2-gbp";
    sha256 = "sha256-knzwMpG1mnsjrb91rWrZgR4OQJPbluWDCJpMy9iTgRo=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros openssl rosidl-default-generators ];
  checkInputs = [ ament-cmake-gtest launch-testing ];
  propagatedBuildInputs = [ rclcpp rosidl-default-runtime ];
  nativeBuildInputs = [ ament-cmake-ros rosidl-default-generators ];

  meta = {
    description = ''Server Side tools for Authorization and Authentication of ROS Clients'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
