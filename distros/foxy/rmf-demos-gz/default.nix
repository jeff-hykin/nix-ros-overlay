
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, gazebo-plugins, joy, launch-xml, rmf-building-sim-gazebo-plugins, rmf-demos, rmf-robot-sim-gazebo-plugins, teleop-twist-joy }:
buildRosPackage {
  pname = "ros-foxy-rmf-demos-gz";
  version = "1.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_demos-release";
    rev = "f5c817fe3fd0079072ca56c01a0fe15ff3b60a72";
    owner = "ros2-gbp";
    sha256 = "sha256-hZtqugmqa19MNRCevrhYoLuy5BfAo1WUDSywCwmgNVo=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-plugins joy launch-xml rmf-building-sim-gazebo-plugins rmf-demos rmf-robot-sim-gazebo-plugins teleop-twist-joy ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Launch files for RMF demos using the Gazebo simulator'';
    license = with lib.licenses; [ asl20 ];
  };
}
