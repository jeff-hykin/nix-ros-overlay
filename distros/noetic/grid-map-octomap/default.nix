
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, grid-map-core, gtest, octomap }:
buildRosPackage {
  pname = "ros-noetic-grid-map-octomap";
  version = "1.6.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grid_map-release";
    rev = "505cfe5348ce72f66f6792268e80db33401f88a8";
    owner = "anybotics";
    sha256 = "sha256-1s3r1WyxwF5UmxWm2rbNzhehG9TDGnpQtP4k86j9xDE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ grid-map-core octomap ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Conversions between grid maps and OctoMap types.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
