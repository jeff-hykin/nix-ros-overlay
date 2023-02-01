
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake }:
buildRosPackage {
  pname = "ros-foxy-urdfdom-headers";
  version = "1.0.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "urdfdom_headers-release";
    rev = "6f4a49b2d1dc6e3e19caa1d1899a72583f4e6c1c";
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
