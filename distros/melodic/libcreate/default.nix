
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake, gtest }:
buildRosPackage {
  pname = "ros-melodic-libcreate";
  version = "2.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libcreate-release";
    rev = "8ce303c56b8bac4c2bfbd4c6c1db3fb85d9f407b";
    owner = "AutonomyLab";
    sha256 = "sha256-xMarg4WuO2CA8Vno3K1l6j/4sPNLQ9XTXcNHt6M8Zr8=";
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
