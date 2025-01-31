
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, can-msgs, lusb, rclcpp, rclcpp-components, std-msgs }:
buildRosPackage {
  pname = "ros-foxy-dataspeed-can-usb";
  version = "2.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dataspeed_can-release";
    rev = "d67319eeb22d881d15f2a6e7c5c525c6fcfb13f5";
    owner = "DataspeedInc-release";
    sha256 = "sha256-ydTwDeP2cNM8nLY8vHK6lkU+AoPQElN7C3xc7yaOoqc=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ];
  propagatedBuildInputs = [ can-msgs lusb rclcpp rclcpp-components std-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Driver to interface with the Dataspeed Inc. USB CAN Tool'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
