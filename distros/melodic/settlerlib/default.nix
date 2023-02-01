
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, calibration-msgs, catkin, rosconsole, rostime }:
buildRosPackage {
  pname = "ros-melodic-settlerlib";
  version = "0.10.14";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "calibration-release";
    rev = "d0d3c2924c2a520f333d536479075e2a51b8950b";
    owner = "ros-gbp";
    sha256 = "sha256-QC+unnWPvccOT7yX2x7c/stwQ/CEabx7SLqoZsSaXwM=";
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
