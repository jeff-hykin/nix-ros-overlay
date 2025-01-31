
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake, geometry-msgs, gtest, mrpt2, ros-environment, roscpp, rosunit, tf2 }:
buildRosPackage {
  pname = "ros-noetic-pose-cov-ops";
  version = "0.3.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pose_cov_ops-release";
    rev = "11225ea12f0088e58358e58f5b2c8271417b77b9";
    owner = "mrpt-ros-pkg-release";
    sha256 = "sha256-PedCn7b0uRpfsVpaUyJ5yPWogpyzEvsBI6xR2g6O7RE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake ros-environment ];
  checkInputs = [ gtest rosunit ];
  propagatedBuildInputs = [ geometry-msgs mrpt2 roscpp tf2 ];
  nativeBuildInputs = [ catkin cmake ];

  meta = {
    description = ''C++ library for SE(2)/SE(3) pose composition operations with uncertainty'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
