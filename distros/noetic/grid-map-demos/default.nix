
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, geometry-msgs, grid-map-core, grid-map-cv, grid-map-filters, grid-map-loader, grid-map-msgs, grid-map-octomap, grid-map-ros, grid-map-rviz-plugin, grid-map-visualization, gtest, octomap-msgs, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-grid-map-demos";
  version = "1.6.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grid_map-release";
    rev = "c5c8182ad6ff00a27c0e2e00fd267781cd1aac87";
    owner = "anybotics";
    sha256 = "sha256-pXxMq6Xq9B06OjQ2OuwhOm65udzVrutP4DEhgaX4pU4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs grid-map-core grid-map-cv grid-map-filters grid-map-loader grid-map-msgs grid-map-octomap grid-map-ros grid-map-rviz-plugin grid-map-visualization octomap-msgs roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Demo nodes to demonstrate the usage of the grid map library.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
