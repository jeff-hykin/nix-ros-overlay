
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, costmap-2d, grid-map-core, gtest, tf }:
buildRosPackage {
  pname = "ros-noetic-grid-map-costmap-2d";
  version = "1.6.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grid_map-release";
    rev = "14086ba84357ff1093fee37df3fe1a2f27b38487";
    owner = "anybotics";
    sha256 = "sha256-lZ7JC33LIskMQOq9xIZqHjuhpakmHF15cCi0eN+uyIg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ costmap-2d grid-map-core tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Interface for grid maps to the costmap_2d format.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
