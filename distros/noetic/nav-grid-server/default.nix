
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, map-server, nav-2d-utils, nav-grid, nav-grid-iterators, nav-grid-pub-sub, nav-msgs, opencv, roscpp, roslib, roslint }:
buildRosPackage {
  pname = "ros-noetic-nav-grid-server";
  version = "0.3.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_navigation-release";
    rev = "e5daf3cd70e3da215c1bd0febce9ba082a22513d";
    owner = "DLu";
    sha256 = "sha256-6kBGntznzhd53DFFdfw7mly9zkDGmqGfN86peaPIEqU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ map-server roslib roslint ];
  propagatedBuildInputs = [ nav-2d-utils nav-grid nav-grid-iterators nav-grid-pub-sub nav-msgs opencv roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Customizable tools for publishing images as NavGrids or OccupancyGrids'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
