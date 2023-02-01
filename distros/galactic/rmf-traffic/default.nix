
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-catch2, eigen, eigen3-cmake-module, libccd, rmf-cmake-uncrustify, rmf-utils }:
buildRosPackage {
  pname = "ros-galactic-rmf-traffic";
  version = "1.4.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_traffic-release";
    rev = "2daba3499debc492c3918076785c75125217c40e";
    owner = "ros2-gbp";
    sha256 = "sha256-x4zp9mi7RsS1oqY27+fWzzsdLfP9BEcjMBM2jRmo+R8=";
  };

  buildType = "cmake";
  checkInputs = [ ament-cmake-catch2 rmf-cmake-uncrustify ];
  propagatedBuildInputs = [ eigen eigen3-cmake-module libccd rmf-utils ];
  nativeBuildInputs = [ eigen3-cmake-module ];

  meta = {
    description = ''Package for managing traffic in the Robotics Middleware Framework'';
    license = with lib.licenses; [ asl20 ];
  };
}
