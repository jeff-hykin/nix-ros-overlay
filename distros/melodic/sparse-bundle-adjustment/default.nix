
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, blas, catkin, eigen, liblapack, roscpp, suitesparse }:
buildRosPackage {
  pname = "ros-melodic-sparse-bundle-adjustment";
  version = "0.4.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "sparse_bundle_adjustment-release";
    rev = "ad91f98ccb2004af80aa0f48ef3ea1feb09b006c";
    owner = "ros-gbp";
    sha256 = "sha256-875J1dmacTFSy9Vsc5exd/cQL747NpnDqFiz+zdnezI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ blas eigen liblapack roscpp suitesparse ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS wrapper for the sparse bundle adjustment (sba) library (needed for slam_karto)'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
