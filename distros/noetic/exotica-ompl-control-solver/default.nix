
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, exotica-core, ompl }:
buildRosPackage {
  pname = "ros-noetic-exotica-ompl-control-solver";
  version = "6.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "exotica-release";
    rev = "c176eff828ebe4ea10876f1fd32cf7df5829817a";
    owner = "ipab-slmc";
    sha256 = "sha256-aFwrdhW9pG+Y4ooimbuqiC1Khf1Jraz2JBNAqURgvRQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ exotica-core ompl ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Kinodynamic Control Solvers from OMPL'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
