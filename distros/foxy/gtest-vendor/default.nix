
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake }:
buildRosPackage {
  pname = "ros-foxy-gtest-vendor";
  version = "1.8.9001-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "googletest-release";
    rev = "3323562f97767b40df7a8fba23ef02ddd6489de0";
    owner = "ros2-gbp";
    sha256 = "sha256-Gy7APHYzmyiyJ1EB0rWCVbsh3zrdKeJTnIPiJ2edi1w=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];

  meta = {
    description = ''The package provides GoogleTest.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
