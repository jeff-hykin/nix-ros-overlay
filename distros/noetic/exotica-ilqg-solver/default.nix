
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, exotica-core, exotica-python }:
buildRosPackage {
  pname = "ros-noetic-exotica-ilqg-solver";
  version = "6.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "exotica-release";
    rev = "913d76b0e01bb0c14d65280747e580506e131f5f";
    owner = "ipab-slmc";
    sha256 = "sha256-UHz/UyAupE+yMN1vXsLt7eAgFfdP3KlxhNkA/dZ0728=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ exotica-core exotica-python ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ILQG Solver (Todorov and Li, 2004)'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
