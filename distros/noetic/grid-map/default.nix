
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, grid-map-core, grid-map-cv, grid-map-demos, grid-map-filters, grid-map-loader, grid-map-msgs, grid-map-ros, grid-map-rviz-plugin, grid-map-visualization }:
buildRosPackage {
  pname = "ros-noetic-grid-map";
  version = "1.6.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grid_map-release";
    rev = "8d22cbb44042e6d74831400e7dab05fba11f0228";
    owner = "anybotics";
    sha256 = "sha256-rrfUsMhqdhUx8AqDkPK9fW4PtjKfcBmCYMIDUp+cChw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ grid-map-core grid-map-cv grid-map-demos grid-map-filters grid-map-loader grid-map-msgs grid-map-ros grid-map-rviz-plugin grid-map-visualization ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Meta-package for the universal grid map library.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
