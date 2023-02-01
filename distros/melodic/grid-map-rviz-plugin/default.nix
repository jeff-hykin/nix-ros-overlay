
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, grid-map-msgs, grid-map-ros, gtest, qt5, rviz }:
buildRosPackage {
  pname = "ros-melodic-grid-map-rviz-plugin";
  version = "1.6.4-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grid_map-release";
    rev = "e274bb14f8003828f170a4064d92c952f5878049";
    owner = "anybotics";
    sha256 = "sha256-qkqH5aUWlSvVepOidlz6yY+8sUudmC/bNxbUjoJGTPE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ grid-map-msgs grid-map-ros qt5.qtbase rviz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''RViz plugin for displaying grid map messages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
