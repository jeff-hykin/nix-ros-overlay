
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, grid-map-msgs, grid-map-ros, gtest, roscpp }:
buildRosPackage {
  pname = "ros-melodic-grid-map-loader";
  version = "1.6.4-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grid_map-release";
    rev = "e6b9464fc4a06c561476a49ce5c099eced57053d";
    owner = "anybotics";
    sha256 = "sha256-XtluSHAsXqk0NwvtosRl66LXHwGemJzwdUx9l/MrNpo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ grid-map-msgs grid-map-ros roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Loading and publishing grid maps from bag files.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
