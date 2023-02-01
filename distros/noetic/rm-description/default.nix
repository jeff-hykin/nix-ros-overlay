
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, xacro }:
buildRosPackage {
  pname = "ros-noetic-rm-description";
  version = "0.1.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rm_description-release";
    rev = "a25ad389b86410ae15b424d2886c573d01edbea6";
    owner = "rm-controls";
    sha256 = "sha256-5pcnGWQCNcbmyLUeHj9Bofm7REjHHJixlygVvpsdDa4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''RoboMaster robot description files'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
