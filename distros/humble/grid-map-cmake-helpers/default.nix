
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core }:
buildRosPackage {
  pname = "ros-humble-grid-map-cmake-helpers";
  version = "2.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grid_map-release";
    rev = "f1f8c547f0b1cb9aeb50e8b9b43168b76d45b208";
    owner = "ros2-gbp";
    sha256 = "sha256-LjphUxeZf8+o/84nll1opLo1LAylfOeaIe2HCwIf2jQ=";
  };

  buildType = "ament_cmake";
  propagatedBuildInputs = [ ament-cmake-core ];
  nativeBuildInputs = [ ament-cmake-core ];

  meta = {
    description = ''CMake support functionality used throughout grid_map'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
