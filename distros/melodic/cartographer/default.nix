
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, cairo, catkin, ceres-solver, eigen, gflags, glog, gtest, lua5, protobuf, pythonPackages }:
buildRosPackage {
  pname = "ros-melodic-cartographer";
  version = "1.0.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cartographer-release";
    rev = "44291f1e5c2bb2811a8fa2a86bdda89316564e7a";
    owner = "ros-gbp";
    sha256 = "sha256-6439JUY2T7ZPbCMhVgUTGhkxC16l80u0vy/ohE24EAc=";
  };

  buildType = "cmake";
  buildInputs = [ catkin gtest pythonPackages.sphinx ];
  propagatedBuildInputs = [ boost cairo ceres-solver eigen gflags glog lua5 protobuf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Cartographer is a system that provides real-time simultaneous localization
    and mapping (SLAM) in 2D and 3D across multiple platforms and sensor
    configurations.'';
    license = with lib.licenses; [ asl20 ];
  };
}
