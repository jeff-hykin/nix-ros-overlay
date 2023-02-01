
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, catkin, common-tutorials, geometry-tutorials, joint-state-publisher-gui, robot, ros-tutorials, roslint, urdf-tutorial, visualization-tutorials, viz }:
buildRosPackage {
  pname = "ros-noetic-desktop";
  version = "1.5.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "metapackages-release";
    rev = "550fbfe6d45449a6e5eb667386e8f6c4ae88a620";
    owner = "ros-gbp";
    sha256 = "sha256-fFoE/pTXO+c8EA0U4oi/GDC61alw1n6H5MfLOF7E++4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ angles common-tutorials geometry-tutorials joint-state-publisher-gui robot ros-tutorials roslint urdf-tutorial visualization-tutorials viz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A metapackage to aggregate several packages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
