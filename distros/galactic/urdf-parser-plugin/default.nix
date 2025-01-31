
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-ros, urdfdom-headers }:
buildRosPackage {
  pname = "ros-galactic-urdf-parser-plugin";
  version = "2.5.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "urdf-release";
    rev = "1b3211a6302b330d2d7aed446d8c637b97772633";
    owner = "ros2-gbp";
    sha256 = "sha256-NN57eRuLU2PF0l60KOqtMW5f2Y/oPgCCWySRwmYNLRM=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ urdfdom-headers ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''This package contains a C++ base class for URDF parsers.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
