
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, qt5, roscpp, std-msgs, swri-profiler-msgs }:
buildRosPackage {
  pname = "ros-noetic-swri-profiler-tools";
  version = "0.2.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "swri_profiler-release";
    rev = "3cfba947e20316de2dd1b73e4c6b99d0b1a82cc6";
    owner = "swri-robotics-gbp";
    sha256 = "sha256-sz4KZc9NYkFu55vuBmgV0ee6zqCb6Tu1X1iqT+FLNOw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ qt5.qtbase roscpp std-msgs swri-profiler-msgs ];
  nativeBuildInputs = [ catkin qt5.qtbase ];

  meta = {
    description = ''Provides tools for viewing data produced by nodes that use the
    swri_profiler library to output profiling information.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
