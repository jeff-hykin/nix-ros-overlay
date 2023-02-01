
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake }:
buildRosPackage {
  pname = "ros-galactic-gtest-vendor";
  version = "1.10.9003-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "googletest-release";
    rev = "40adab3dec74c732b8a211a777b0e8b2d1ffa7e9";
    owner = "ros2-gbp";
    sha256 = "sha256-gNHdPKMhcQ2OvKIF46hl7FLGTtq7OWtkdzdjStdfnYY=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];

  meta = {
    description = ''The package provides GoogleTest.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
