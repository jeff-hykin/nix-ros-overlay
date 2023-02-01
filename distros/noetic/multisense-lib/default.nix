
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, libpng }:
buildRosPackage {
  pname = "ros-noetic-multisense-lib";
  version = "4.0.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "multisense_ros-release";
    rev = "62ee0ca2779844ba0d5dda1577fa207c024022f2";
    owner = "carnegieroboticsllc";
    sha256 = "sha256-QNxkWpR9lnfVEiXF3vfdN21fdqEQhSMQB+TnMmN98JU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge libpng ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''multisense_lib'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
