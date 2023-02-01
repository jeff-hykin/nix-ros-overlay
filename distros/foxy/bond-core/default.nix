
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, bond, bondcpp, smclib, test-bond }:
buildRosPackage {
  pname = "ros-foxy-bond-core";
  version = "2.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "bond_core-release";
    rev = "d9b4f2adf9b540ebd5e9312d731f31e13157e3ba";
    owner = "ros2-gbp";
    sha256 = "sha256-4GHuXRuGmL+Tx/y6Z/vUS+JUYkZv8XijCypWvcUSy5w=";
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
