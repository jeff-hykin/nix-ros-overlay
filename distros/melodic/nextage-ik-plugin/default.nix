
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, liblapack, moveit-core, pluginlib, roscpp, tf-conversions }:
buildRosPackage {
  pname = "ros-melodic-nextage-ik-plugin";
  version = "0.8.6-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rtmros_nextage-release";
    rev = "dacb6cb991d8f9cf3f75caa3b50cf6c347ab246e";
    owner = "tork-a";
    sha256 = "sha256-XW9zLx8/cC3EQ79BpViYaAu9xOzSps/o8i7Aqa8yzfA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ liblapack moveit-core pluginlib roscpp tf-conversions ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''IKFast package for NEXTAGE Open'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
