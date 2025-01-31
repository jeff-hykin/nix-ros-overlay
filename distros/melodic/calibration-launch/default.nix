
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, interval-intersection, joint-states-settler, laser-cb-detector, monocam-settler, urdfdom-py }:
buildRosPackage {
  pname = "ros-melodic-calibration-launch";
  version = "0.10.14";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "calibration-release";
    rev = "e00d996d7fab39b06a0f44c3c3c02977dd3da567";
    owner = "ros-gbp";
    sha256 = "sha256-Vzs6YSu1MGKAAHWQNV+6ccC6o+Zr6J4/oSxlG3YT1zQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ interval-intersection joint-states-settler laser-cb-detector monocam-settler urdfdom-py ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains a collection of launch files that can be helpful in configuring
    the calibration stack to run on your robot.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
