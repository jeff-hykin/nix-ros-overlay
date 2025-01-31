
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, mbf-mesh-core, mbf-msgs, mbf-utility, mesh-map, roscpp }:
buildRosPackage {
  pname = "ros-noetic-dijkstra-mesh-planner";
  version = "1.0.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mesh_navigation-release";
    rev = "f15f2ca374b022ee906fd0aa98aa83bdc0168e9e";
    owner = "uos-gbp";
    sha256 = "sha256-0jcTvJztBd30A7Qi+8EC432y/Kq2LavgyO4SVDU+nCY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure mbf-mesh-core mbf-msgs mbf-utility mesh-map roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The dijkstra_mesh_planner package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
