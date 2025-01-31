
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pcl-ros, roscpp, roslaunch, rosunit, tf2-eigen, tf2-ros }:
buildRosPackage {
  pname = "ros-melodic-map-merge-3d";
  version = "0.1.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "map-merge-release";
    rev = "93aff190ed50b2de8454fe9372ac25d947a06780";
    owner = "hrnr";
    sha256 = "sha256-0xb0lWqzgX/pqN10nFMcp8y3il+eewU8+EOgSlzRJ+Y=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rosunit ];
  propagatedBuildInputs = [ pcl-ros roscpp tf2-eigen tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Merging multiple 3D maps, represented as pointclouds,
  without knowledge of initial positions of robots.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
