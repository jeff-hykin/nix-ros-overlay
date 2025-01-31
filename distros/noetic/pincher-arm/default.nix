
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pincher-arm-bringup, pincher-arm-description, pincher-arm-ikfast-plugin, pincher-arm-moveit-config, pincher-arm-moveit-demos }:
buildRosPackage {
  pname = "ros-noetic-pincher-arm";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pincher_arm-release";
    rev = "d38fa54d0bd29d783ac3fe95c563e11a4fcd8da1";
    owner = "fictionlab-gbp";
    sha256 = "sha256-M13EHfXPoBG75tR50Toawzt+D7tWgtHGc6BVES08HFU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pincher-arm-bringup pincher-arm-description pincher-arm-ikfast-plugin pincher-arm-moveit-config pincher-arm-moveit-demos ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pincher_arm metapackage.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
