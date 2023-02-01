
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, raspimouse-navigation, raspimouse-slam }:
buildRosPackage {
  pname = "ros-foxy-raspimouse-slam-navigation";
  version = "1.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "raspimouse_slam_navigation_ros2-release";
    rev = "139cba20cefd8468765f6b3c657f26dfbabc971f";
    owner = "ros2-gbp";
    sha256 = "sha256-ivTO7khAkTpNkrZKbzx+5Pz6tVr8t1V2BF2IIkVrlfc=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ raspimouse-navigation raspimouse-slam ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''SLAM and navigation packages for Raspberry Pi Mouse V3'';
    license = with lib.licenses; [ asl20 ];
  };
}
