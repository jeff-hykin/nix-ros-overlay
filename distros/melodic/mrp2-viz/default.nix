
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rviz }:
buildRosPackage {
  pname = "ros-melodic-mrp2-viz";
  version = "0.2.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrp2_desktop-release";
    rev = "d7d84add8c9757f7d848c29012f92712a1bb368a";
    owner = "milvusrobotics";
    sha256 = "sha256-LRHxLT/r/wBCiOHuI43iOng6l5P0esISCRJiwrn7B+o=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rviz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''RViz configurations and launch files for visualization.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
