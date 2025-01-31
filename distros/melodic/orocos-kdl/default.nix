
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake, cppunit, eigen, pkg-config }:
buildRosPackage {
  pname = "ros-melodic-orocos-kdl";
  version = "1.4.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "orocos-kdl-release";
    rev = "71becc16b1ef98143a19d5570949ca7f1d19e049";
    owner = "orocos";
    sha256 = "sha256-ffRvDGvdYmVn4nEAzebOhpfe1u6ovIT2yEuLyTQH/wQ=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  checkInputs = [ cppunit ];
  propagatedBuildInputs = [ catkin eigen pkg-config ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''This package contains a recent version of the Kinematics and Dynamics
    Library (KDL), distributed by the Orocos Project.'';
    license = with lib.licenses; [ "LGPL" ];
  };
}
