
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, bond, bondcpp, smclib, test-bond }:
buildRosPackage {
  pname = "ros-galactic-bond-core";
  version = "3.0.1-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "bond_core-release";
    rev = "4ad6ae87cf7dea6571f40c23a85975d7d6135d8d";
    owner = "ros2-gbp";
    sha256 = "sha256-XFYn9lgMyoTaWALFnK+8jHo2FcE8eGUzvZVBcOuWW9E=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bond bondcpp smclib test-bond ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''A bond allows two processes, A and B, to know when the other has
    terminated, either cleanly or by crashing. The bond remains
    connected until it is either broken explicitly or until a
    heartbeat times out.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
