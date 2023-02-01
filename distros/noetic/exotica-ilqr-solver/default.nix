
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, exotica-core, exotica-python }:
buildRosPackage {
  pname = "ros-noetic-exotica-ilqr-solver";
  version = "6.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "exotica-release";
    rev = "358b3f9016f1014f31d5ddba995386accfe8e445";
    owner = "ipab-slmc";
    sha256 = "sha256-aTqXEZ+k42nRlgVmvLS1QB7t2mF/C7ZHKq1SHU46QUY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ exotica-core exotica-python ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ILQR Solver (Li and Todorov, 2004)'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
