
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core, boost, gtest, lanelet2-core, mrt-cmake-modules, pugixml }:
buildRosPackage {
  pname = "ros-galactic-lanelet2-io";
  version = "1.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "lanelet2-release";
    rev = "0dbf72b11390dabdfd974b1cfc727bcd6789a35d";
    owner = "fzi-forschungszentrum-informatik";
    sha256 = "sha256-mW8p1j9qBuv8wPpmUu1kWNNJb7+pngf70mRvO8NciSc=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-core ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ boost lanelet2-core mrt-cmake-modules pugixml ];
  nativeBuildInputs = [ ament-cmake-core mrt-cmake-modules ];

  meta = {
    description = ''Parser/Writer module for lanelet2'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
