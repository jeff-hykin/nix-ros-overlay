
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, calibration-msgs, catkin, rosconsole, rostime }:
buildRosPackage {
  pname = "ros-noetic-settlerlib";
  version = "0.10.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "calibration-release";
    rev = "2efff72da66f09ed9c78bc44c993ade09ee7f2fa";
    owner = "ros-gbp";
    sha256 = "sha256-IzwM4117RXEovzFCq3mnkGXIf4tsZBejilCBvy7eNdY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ boost calibration-msgs rosconsole rostime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Defines helper functions and routines that greatly help when trying to create a settler
    for a specific sensor channel. This package is experimental and unstable.
    Expect its APIs to change.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
