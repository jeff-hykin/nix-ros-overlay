
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-catch2, eigen, libccd, rmf-cmake-uncrustify, rmf-utils }:
buildRosPackage {
  pname = "ros-foxy-rmf-traffic";
  version = "1.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_traffic-release";
    rev = "74b59ff221ea97c7008844262eea1d1e9343d605";
    owner = "ros2-gbp";
    sha256 = "sha256-RuTAkrEF7VPPlx0KggMEtfzek8MnOVGr7200Rx91zu4=";
  };

  buildType = "cmake";
  checkInputs = [ ament-cmake-catch2 rmf-cmake-uncrustify ];
  propagatedBuildInputs = [ eigen libccd rmf-utils ];

  meta = {
    description = ''Package for managing traffic in the Robotics Middleware Framework'';
    license = with lib.licenses; [ asl20 ];
  };
}
