
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, nlopt, orocos-kdl, trac-ik-lib, xacro }:
buildRosPackage {
  pname = "ros-noetic-trac-ik-examples";
  version = "1.6.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "trac_ik-release";
    rev = "8e15f05825a8cfad040055b1e1508fc9e938abfb";
    owner = "traclabs";
    sha256 = "sha256-UR1JHuV3cggT3ciKoVwJX38+Kv9Blv+FyqnMlSrseVo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ boost nlopt orocos-kdl trac-ik-lib xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains the source code for testing and comparing trac_ik'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
