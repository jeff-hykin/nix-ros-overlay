
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake, orocos-kdl, pythonPackages }:
buildRosPackage {
  pname = "ros-melodic-python-orocos-kdl";
  version = "1.4.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "orocos-kdl-release";
    rev = "6995671810f03c03fce006d04883b6899ccece10";
    owner = "orocos";
    sha256 = "sha256-e69GqpbNlxwewDvXFOxVS7bPTuM5vzIrFvfarEXH4bs=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ catkin orocos-kdl pythonPackages.sip_4 ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''This package contains the python bindings PyKDL for the Kinematics and Dynamics
    Library (KDL), distributed by the Orocos Project.'';
    license = with lib.licenses; [ "LGPL" ];
  };
}
