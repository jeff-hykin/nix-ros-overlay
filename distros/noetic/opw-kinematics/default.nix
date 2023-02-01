
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake, eigen, gtest, ros-industrial-cmake-boilerplate }:
buildRosPackage {
  pname = "ros-noetic-opw-kinematics";
  version = "0.5.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "opw_kinematics-release";
    rev = "4de57561403d5a201e19d865386bc20035b8c0d4";
    owner = "ros-industrial-release";
    sha256 = "sha256-G2Lj2UvjoqAHRVoajJeE+nwExpIcXlNcajM3nLIBPh4=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ros-industrial-cmake-boilerplate ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ eigen ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''A simple, analytical inverse kinematic library for industrial robots with parallel bases and
    spherical wrists. Based on the paper &quot;An Analytical Solution of the Inverse Kinematics Problem
    of Industrial Serial Manipulators with an Ortho-parallel Basis and a Spherical Wrist&quot; by
    Mathias Brandstötter, Arthur Angerer, and Michael Hofbaur.'';
    license = with lib.licenses; [ asl20 ];
  };
}
