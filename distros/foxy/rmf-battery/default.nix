
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-catch2, eigen, rmf-cmake-uncrustify, rmf-traffic, rmf-utils }:
buildRosPackage {
  pname = "ros-foxy-rmf-battery";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_battery-release";
    rev = "1ebf01cfa2a8a606946a6d2d4b5b96c6dbb51f16";
    owner = "ros2-gbp";
    sha256 = "sha256-B5Ind7cMPaFPCNu651gqUr7i8w7o0AmryaNgkET75k4=";
  };

  buildType = "cmake";
  checkInputs = [ ament-cmake-catch2 rmf-cmake-uncrustify ];
  propagatedBuildInputs = [ eigen rmf-traffic rmf-utils ];

  meta = {
    description = ''Package for modelling battery life of robots'';
    license = with lib.licenses; [ asl20 ];
  };
}
