
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake }:
buildRosPackage {
  pname = "ros-melodic-octomap";
  version = "1.9.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "octomap-release";
    rev = "88e71c9431372e64721ee5fd36f7dcb6fd1a728c";
    owner = "ros-gbp";
    sha256 = "sha256-1C49qDf+5BFNi34JzrSFN0B0kNfv1MBTmcdT/hEjkKI=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ catkin ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''The OctoMap library implements a 3D occupancy grid mapping approach, providing data structures and mapping algorithms in C++. The map implementation is based on an octree. See
  http://octomap.github.io for details.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
