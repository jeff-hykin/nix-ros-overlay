
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, grid-map-core, gtest, pcl-ros }:
buildRosPackage {
  pname = "ros-noetic-grid-map-sdf";
  version = "1.6.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grid_map-release";
    rev = "9aaf92ba549d46f5628ad542babe4a716223c8c4";
    owner = "anybotics";
    sha256 = "sha256-bYaVjHvW0jqJ1BocdFcw+h15heGsQKMLbRg65eHHQew=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ grid-map-core pcl-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Generates signed distance fields from grid maps.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
