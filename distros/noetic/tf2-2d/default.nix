
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, roscpp, roslint, tf2, tf2-geometry-msgs }:
buildRosPackage {
  pname = "ros-noetic-tf2-2d";
  version = "0.6.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tf2_2d-release";
    rev = "fe2af1e023fe305499485d834ef190366c62af50";
    owner = "locusrobotics";
    sha256 = "sha256-fzb/KTasnwpnYHrHv+LYFIZ+HiS+a+zTiZ6t1CBuUMk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint ];
  propagatedBuildInputs = [ eigen roscpp tf2 tf2-geometry-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A set of 2D geometry classes modeled after the 3D geometry classes in tf2.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
