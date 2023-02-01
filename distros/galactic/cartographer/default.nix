
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, cairo, ceres-solver, cmake, eigen, gflags, glog, gtest, lua5, protobuf, python3Packages }:
buildRosPackage {
  pname = "ros-galactic-cartographer";
  version = "1.0.9001-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cartographer-release";
    rev = "8c52023a2be52dc519245d335ea3023c44aa7af0";
    owner = "ros2-gbp";
    sha256 = "sha256-rxyicosQIdt8xA6pfNTFge/sZ210UDpfJDONaluNWjA=";
  };

  buildType = "cmake";
  buildInputs = [ cmake gtest python3Packages.sphinx ];
  propagatedBuildInputs = [ boost cairo ceres-solver eigen gflags glog lua5 protobuf ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Cartographer is a system that provides real-time simultaneous localization
    and mapping (SLAM) in 2D and 3D across multiple platforms and sensor
    configurations.'';
    license = with lib.licenses; [ asl20 ];
  };
}
