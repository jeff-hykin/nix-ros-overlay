
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake }:
buildRosPackage {
  pname = "ros-foxy-contracts-lite-vendor";
  version = "0.5.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "contracts_lite_vendor-release";
    rev = "04dcefa6ce8a1d562c142149b44a6e68cdabc247";
    owner = "ros-safety";
    sha256 = "sha256-b59pq5UJ6e3vtngK1InKk+9bvvfO1GJ8KG1DVg4ucHU=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''ROS 2 wrapper for the Contracts Lite project.'';
    license = with lib.licenses; [ asl20 ];
  };
}
