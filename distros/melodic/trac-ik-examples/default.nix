
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, orocos-kdl, trac-ik-lib, xacro }:
buildRosPackage {
  pname = "ros-melodic-trac-ik-examples";
  version = "1.5.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "trac_ik-release";
    rev = "9dcef813b8dbe695632793bda1aa3599810eb9ca";
    owner = "traclabs";
    sha256 = "sha256-EWR8rgCYY8h3qZ8DT7hcy9cDb8mbiTwrdUMPU1d3V1M=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ boost orocos-kdl trac-ik-lib xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains the source code for testing and comparing trac_ik'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
