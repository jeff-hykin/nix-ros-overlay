
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ecl-license }:
buildRosPackage {
  pname = "ros-foxy-ecl-build";
  version = "1.0.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_tools-release";
    rev = "ba6692d346c8e0bb2921881f5274449422e535f9";
    owner = "yujinrobot-release";
    sha256 = "sha256-GrX5mhJ3gjlfBIMijfMIjJ00RQtndKXMUAr+lgfosHM=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ecl-license ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Collection of cmake/make build tools primarily for ecl development itself, but also
     contains a few cmake modules useful outside of the ecl.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
