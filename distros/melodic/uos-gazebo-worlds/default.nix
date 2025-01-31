
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros }:
buildRosPackage {
  pname = "ros-melodic-uos-gazebo-worlds";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uos-tools";
    rev = "77a3b1f464329786b78a6ca7f6fa34ce1b40b291";
    owner = "uos-gbp";
    sha256 = "sha256-qbRkGncHGgF38t+Co32c6ius/n9HUmpu6+koHWKBYOg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Gazebo world and model files for UOS.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
