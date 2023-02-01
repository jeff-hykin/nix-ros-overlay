
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake }:
buildRosPackage {
  pname = "ros-humble-gtest-vendor";
  version = "1.10.9004-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "googletest-release";
    rev = "20131d7c09d8ddecdce7342c7bc482da0dabca48";
    owner = "ros2-gbp";
    sha256 = "sha256-u2gx0IqMkxU6eLi5phF25OuU1T4HZuCuIhQBi48RXYM=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];

  meta = {
    description = ''The package provides GoogleTest.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
