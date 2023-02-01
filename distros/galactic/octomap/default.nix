
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake }:
buildRosPackage {
  pname = "ros-galactic-octomap";
  version = "1.9.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "octomap-release";
    rev = "f70b17766e1c68221c71f54970868af9395c5d4f";
    owner = "ros-gbp";
    sha256 = "sha256-8DAIMo4RdqnTKlM9nK2fg9FEc9jiOtHIL52VQjvOY10=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''The OctoMap library implements a 3D occupancy grid mapping approach, providing data structures and mapping algorithms in C++. The map implementation is based on an octree. See
  http://octomap.github.io for details.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
