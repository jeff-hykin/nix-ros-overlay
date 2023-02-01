
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, nav-msgs }:
buildRosPackage {
  pname = "ros-melodic-hector-map-tools";
  version = "0.4.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_slam-release";
    rev = "7225781c6def9aa02654827838207928cc6a2620";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-IEVPZUR7A73fYQG08NaTSSnEVOEy7xCvx6OqDWlFFOk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eigen nav-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''hector_map_tools contains some functions related to accessing information from OccupancyGridMap maps.
    Currently consists of a single header.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
