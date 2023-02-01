
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, qt5, roscpp, rviz }:
buildRosPackage {
  pname = "ros-melodic-librviz-tutorial";
  version = "0.10.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_tutorials-release";
    rev = "de7bdbdedfd635eb100098d3c220a5db37200c1e";
    owner = "ros-gbp";
    sha256 = "sha256-yYKKxG0rr/K1gVFsrBmG77x/h58vbDMVtMsI6s0zSto=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ qt5.qtbase roscpp rviz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Tutorial showing how to compile your own C++ program with RViz displays and features.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
