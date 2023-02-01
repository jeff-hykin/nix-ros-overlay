
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, mbf-mesh-core, mbf-msgs, mbf-utility, mesh-map, roscpp }:
buildRosPackage {
  pname = "ros-melodic-cvp-mesh-planner";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mesh_navigation-release";
    rev = "64ccd0a271643766549706f96e64206957f13dc9";
    owner = "uos-gbp";
    sha256 = "sha256-RbPYuvZiCDhgnFZuUBkYFtdpaiHRQcsby6m+UlFSoTs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure mbf-mesh-core mbf-msgs mbf-utility mesh-map roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The Continuous Vector Field Planner (CVP) mesh planner package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
