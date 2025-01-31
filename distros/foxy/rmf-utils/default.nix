
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-catch2, cmake, rmf-cmake-uncrustify }:
buildRosPackage {
  pname = "ros-foxy-rmf-utils";
  version = "1.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_utils-release";
    rev = "d3798d84cf6cbb4e896815b35eaf7e7d934696a4";
    owner = "ros2-gbp";
    sha256 = "sha256-RzePMaMfqYXF3kxwlmlcTmOb1EdbiLzgAXZTkOnxj1I=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  checkInputs = [ ament-cmake-catch2 rmf-cmake-uncrustify ];

  meta = {
    description = ''Simple C++ programming utilities used by Robotics Middleware Framework packages'';
    license = with lib.licenses; [ asl20 ];
  };
}
