
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, cmake, eigen }:
buildRosPackage {
  pname = "ros-foxy-libnabo";
  version = "1.0.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libnabo-release";
    rev = "16a96ad158e43af555e8fa31d2e59dc50d305b69";
    owner = "nobleo";
    sha256 = "sha256-Jw5AWmdPvBZQlJgcl9gIvuvYSe/MxzFT8npWLQtu1i4=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ boost eigen ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''libnabo is a fast K Nearest Neighbour library for low-dimensional spaces.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
