
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake, gtest }:
buildRosPackage {
  pname = "ros-noetic-libcreate";
  version = "3.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libcreate-release";
    rev = "e9b7fb57c3c2a252557c113e54b21779b45156c1";
    owner = "AutonomyLab";
    sha256 = "sha256-N4LES05+bOdNbL4UiPVhWx8Hfa/1JO/zpsh8wiiH7Tk=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ boost catkin ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''C++ library for interfacing with iRobot's Create 1 and Create 2'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
