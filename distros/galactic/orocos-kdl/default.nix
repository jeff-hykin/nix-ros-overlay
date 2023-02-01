
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake, cppunit, eigen, eigen3-cmake-module, pkg-config }:
buildRosPackage {
  pname = "ros-galactic-orocos-kdl";
  version = "3.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "orocos_kinematics_dynamics-release";
    rev = "6efe902b5ff905bf2bf8f84df22a65629396a608";
    owner = "ros2-gbp";
    sha256 = "sha256-VsYBqpDhQYSYuKKnwQEH64aRwsHQ6V9NmqMycHzp/cM=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  checkInputs = [ cppunit ];
  propagatedBuildInputs = [ eigen eigen3-cmake-module pkg-config ];
  nativeBuildInputs = [ cmake eigen3-cmake-module ];

  meta = {
    description = ''This package contains a recent version of the Kinematics and Dynamics
    Library (KDL), distributed by the Orocos Project.'';
    license = with lib.licenses; [ "LGPL-2.1-or-later" ];
  };
}
