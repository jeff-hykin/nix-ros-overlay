
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, cmake, eigen, pkg-config }:
buildRosPackage {
  pname = "ros-melodic-ompl";
  version = "1.4.2-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ompl-release";
    rev = "bbd79eb27ecbfec4fbf9a80c7c13b3a4610e4ad2";
    owner = "ros-gbp";
    sha256 = "sha256-KQ8OmlflFYAPBwJaeDwEdE5Gco/c/KJsPteM3ZKnbMk=";
  };

  buildType = "cmake";
  buildInputs = [ cmake pkg-config ];
  propagatedBuildInputs = [ boost eigen ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''OMPL is a free sampling-based motion planning library.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
