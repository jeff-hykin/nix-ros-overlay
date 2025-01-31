
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake-modules, console-bridge, rostest, tinyxml-2, urdf, urdfdom-py }:
buildRosPackage {
  pname = "ros-noetic-srdfdom";
  version = "0.6.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "srdfdom-release";
    rev = "bbe68da3f3abaa6143ca51f3c18567df55084594";
    owner = "ros-gbp";
    sha256 = "sha256-1KW8twq9SZrNP1tnatNhSSYcGgIduPY8wnaRYD7bShY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules console-bridge ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ boost tinyxml-2 urdf urdfdom-py ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Parser for Semantic Robot Description Format (SRDF).'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
