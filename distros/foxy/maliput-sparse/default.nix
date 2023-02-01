
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-clang-format, ament-cmake-gmock, ament-cmake-gtest, maliput }:
buildRosPackage {
  pname = "ros-foxy-maliput-sparse";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "maliput_sparse-release";
    rev = "2073ed3fe09f18f29a07fecf118effc8a7408f67";
    owner = "ros2-gbp";
    sha256 = "sha256-FBExfeb0THYPuW4z+jdc+ptbDw3TZL3ZoNH3uzzLvgs=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-gmock ament-cmake-gtest ];
  propagatedBuildInputs = [ maliput ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Maliput sparse is a maliput backend built on top of waypoints without any analytical model of the surface'';
    license = with lib.licenses; [ "BSD-Clause-3" ];
  };
}
