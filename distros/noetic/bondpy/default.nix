
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, bond, catkin, python3Packages, rospy, smclib, util-linux }:
buildRosPackage {
  pname = "ros-noetic-bondpy";
  version = "1.8.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "bond_core-release";
    rev = "eb883d48ab4b4e097667ccbef346c9b5300c1bdc";
    owner = "ros-gbp";
    sha256 = "sha256-cqfnNxlKTXuHdNfPkD0t7fhQ45gEM9icNi+yLXC2EeY=";
  };

  buildType = "catkin";
  buildInputs = [ bond catkin python3Packages.setuptools ];
  propagatedBuildInputs = [ rospy smclib util-linux ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''Python implementation of bond, a mechanism for checking when
    another process has terminated.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
