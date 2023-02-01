
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, gtest, lanelet2-core, mrt-cmake-modules, pugixml }:
buildRosPackage {
  pname = "ros-noetic-lanelet2-io";
  version = "1.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "lanelet2-release";
    rev = "3c54782de61c5083542172ad13f73ac19c909e3b";
    owner = "fzi-forschungszentrum-informatik";
    sha256 = "sha256-mW8p1j9qBuv8wPpmUu1kWNNJb7+pngf70mRvO8NciSc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ boost lanelet2-core mrt-cmake-modules pugixml ];
  nativeBuildInputs = [ catkin mrt-cmake-modules ];

  meta = {
    description = ''Parser/Writer module for lanelet2'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
