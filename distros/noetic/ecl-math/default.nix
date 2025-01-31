
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-license, ecl-type-traits }:
buildRosPackage {
  pname = "ros-noetic-ecl-math";
  version = "0.62.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_core-release";
    rev = "4ed9658e345e53cc0ad21ed2fbca5a1c6514d61f";
    owner = "yujinrobot-release";
    sha256 = "sha256-PRwdl42b6z20EXmH2UzmR4Zv2Q5mqI4KfF/Nznt/enE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ecl-license ecl-type-traits ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides simple support to cmath, filling in holes
    or redefining in a c++ formulation where desirable.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
