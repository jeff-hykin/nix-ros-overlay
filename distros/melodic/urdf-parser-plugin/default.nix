
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, urdfdom-headers }:
buildRosPackage {
  pname = "ros-melodic-urdf-parser-plugin";
  version = "1.13.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "urdf-release";
    rev = "ee174fb9ef65092a8311ccea00a30114b9cc72d5";
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
