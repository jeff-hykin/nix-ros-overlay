
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-p2os-doc";
  version = "2.1.1-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "p2os-release";
    rev = "3270dc2038c0bc38211514b6c43bde0582012a08";
    owner = "allenh1";
    sha256 = "sha256-Ue0+fXcE67rZdtFmkn4tWg6dPEn1a2Qq0lJUklkt9EU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Contains the Documentation for the p2os driver/componenets'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
