
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, urdfdom-headers }:
buildRosPackage {
  pname = "ros-noetic-urdf-parser-plugin";
  version = "1.13.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "urdf-release";
    rev = "ec123c82273e8cf4e69d4b6c299275ce3587487d";
    owner = "ros-gbp";
    sha256 = "sha256-DShxAFWFuiNgRTPwyuqtwkAAXIR75aD+kWQX7VUVJWc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ urdfdom-headers ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains a C++ base class for URDF parsers.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
