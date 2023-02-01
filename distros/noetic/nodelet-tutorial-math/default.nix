
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nodelet, roscpp, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-nodelet-tutorial-math";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "common_tutorials-release";
    rev = "6db3564e5f1840ecdd56af4b5a3306d3885f493d";
    owner = "ros-gbp";
    sha256 = "sha256-cBjW3YPcYJlrCX+fwR8p/6OIGRM7vl/Va5lQEBlQ5Qg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ nodelet roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package for Nodelet tutorial.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
