
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, distance-map-core, distance-map-deadreck, distance-map-msgs, distance-map-node, distance-map-opencv, distance-map-rviz, distance-map-tools }:
buildRosPackage {
  pname = "ros-melodic-distance-map";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "distance_map-release";
    rev = "14ece91991874369b10a60d38fce0d5dd7be110a";
    owner = "artivis";
    sha256 = "sha256-fGNcnzSulyEi380yHHbHgXhzsy2n/KXBMtOVhBmwF1c=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ distance-map-core distance-map-deadreck distance-map-msgs distance-map-node distance-map-opencv distance-map-rviz distance-map-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The distance_map metapackage'';
    license = with lib.licenses; [ asl20 ];
  };
}
