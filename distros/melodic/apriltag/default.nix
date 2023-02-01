
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake, opencv }:
buildRosPackage {
  pname = "ros-melodic-apriltag";
  version = "3.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "apriltag-release";
    rev = "e4a87d1309da5ca67ccc692f4353c7d4d96457b6";
    owner = "AprilRobotics";
    sha256 = "sha256-6kUYVWACrNDZBeDwDanrR3mgspXi5sPGKoy4chT7IrM=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  checkInputs = [ opencv ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''AprilTag detector library'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
