
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake, cppunit, eigen, eigen3-cmake-module, pkg-config }:
buildRosPackage {
  pname = "ros-foxy-orocos-kdl";
  version = "3.3.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "orocos_kinematics_dynamics-release";
    rev = "4d801f3b10f192eaa87674c5731b7ed1298d916b";
    owner = "ros2-gbp";
    sha256 = "sha256-OGJTX9wdGxUeopm3ThD1jhLJoYEQuTqZnMZSrdQiZO8=";
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
