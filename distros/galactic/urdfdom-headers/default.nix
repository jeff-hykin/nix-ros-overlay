
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake }:
buildRosPackage {
  pname = "ros-galactic-urdfdom-headers";
  version = "1.0.5-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "urdfdom_headers-release";
    rev = "6e84ebf0bff3bbca159e92322921f33144425c03";
    owner = "ros2-gbp";
    sha256 = "sha256-lJ6+SPbBfHw8MA4RU+NqSCErpOXv1bM/FKl7lVkbsqY=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''C++ headers for URDF.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
