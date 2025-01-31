
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, image-geometry, map-msgs, nav-msgs, roscpp, roslaunch, rosunit, tf2-geometry-msgs }:
buildRosPackage {
  pname = "ros-noetic-multirobot-map-merge";
  version = "2.1.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "m-explore-release";
    rev = "1b585d794ad4d9460002e319a8ab8b0638fb6eea";
    owner = "hrnr";
    sha256 = "sha256-y2/4j5S1DXEjv860XEhaPFk5KNqljNLeCYxbgkgL2XA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rosunit ];
  propagatedBuildInputs = [ geometry-msgs image-geometry map-msgs nav-msgs roscpp tf2-geometry-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Merging multiple maps without knowledge of initial
  positions of robots.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
