
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, desktop, perception, simulators, urdf-sim-tutorial }:
buildRosPackage {
  pname = "ros-noetic-desktop-full";
  version = "1.5.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "metapackages-release";
    rev = "b9ca0feca68d7987c0271c22291b69763a0bd97d";
    owner = "ros-gbp";
    sha256 = "sha256-AGWIFkHAQ0EvTeZBj8VbLPcqCHnNcvzgy6bvPi+pYlc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ desktop perception simulators urdf-sim-tutorial ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A metapackage to aggregate several packages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
