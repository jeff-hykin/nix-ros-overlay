
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-core, ecl-lite, ecl-manipulation, ecl-navigation, ecl-tools }:
buildRosPackage {
  pname = "ros-melodic-ecl";
  version = "0.60.3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_manipulation-release";
    rev = "15051ae599a1a585a099d44982464760909b06d4";
    owner = "yujinrobot-release";
    sha256 = "sha256-wImPsGnMNl1+3vx8K9dnH9LNaGYKChHtOEMmVgL9FSY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ecl-core ecl-lite ecl-manipulation ecl-navigation ecl-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage bringing all of ecl together.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
