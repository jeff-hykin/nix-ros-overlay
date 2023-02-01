
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-catch2, eigen, libyamlcpp, rclcpp, rmf-cmake-uncrustify, rmf-fleet-msgs, rmf-traffic, rmf-traffic-msgs, rmf-utils }:
buildRosPackage {
  pname = "ros-galactic-rmf-traffic-ros2";
  version = "1.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_ros2-release";
    rev = "675dd1c277f8b51eb59908c084afcdef9bb68d7e";
    owner = "ros2-gbp";
    sha256 = "sha256-GvSLH+ay7D8Ml4Zr6PqFTB2XF4YIaIRsYXGFSDYSUhk=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake eigen ];
  checkInputs = [ ament-cmake-catch2 rmf-cmake-uncrustify ];
  propagatedBuildInputs = [ libyamlcpp rclcpp rmf-fleet-msgs rmf-traffic rmf-traffic-msgs rmf-utils ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''A package containing messages used by the RMF traffic management system.'';
    license = with lib.licenses; [ asl20 ];
  };
}
