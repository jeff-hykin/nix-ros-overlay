
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-uos-maps";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uos-tools";
    rev = "14067221a3e4a8bf9a4c9cb883c615f5a60153e3";
    owner = "uos-gbp";
    sha256 = "sha256-fOpXXZEQLeKmaFGK0dK39NNlS5w5k20CX3pjKd0kCig=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Navigation maps of the Osnabrueck University'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
