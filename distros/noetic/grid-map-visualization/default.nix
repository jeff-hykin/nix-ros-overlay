
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, grid-map-core, grid-map-msgs, grid-map-ros, gtest, nav-msgs, roscpp, sensor-msgs, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-grid-map-visualization";
  version = "1.6.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grid_map-release";
    rev = "d6f38b66fd49a2cb478a2ca987ca90f0ba7d43c4";
    owner = "anybotics";
    sha256 = "sha256-t8Fme0mbDCSk+cvB9kgQDk2yl8p0Zh8AeGSegyIxq/A=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ grid-map-core grid-map-msgs grid-map-ros nav-msgs roscpp sensor-msgs tf visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Configurable tool to visualize grid maps in RViz.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
