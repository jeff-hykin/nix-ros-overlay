
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-clang-format, ament-cmake-gmock, ament-cmake-gtest, lanelet2-io, maliput, maliput-sparse }:
buildRosPackage {
  pname = "ros-foxy-maliput-osm";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "maliput_osm-release";
    rev = "d008f435a9d6e90a8698d811e837442e1dc2289f";
    owner = "ros2-gbp";
    sha256 = "sha256-If/aog3hiii298Z4lriT6xTooIwS0ax6XAojdo72xbk=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-gmock ament-cmake-gtest ];
  propagatedBuildInputs = [ lanelet2-io maliput maliput-sparse ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Maliput backend for loading lanelet2-based osm maps.'';
    license = with lib.licenses; [ bsd3 ];
  };
}
