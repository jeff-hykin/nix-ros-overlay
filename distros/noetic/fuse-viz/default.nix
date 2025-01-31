
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, fuse-constraints, fuse-core, fuse-msgs, fuse-variables, geometry-msgs, qt5, roslint, rviz, tf2-geometry-msgs }:
buildRosPackage {
  pname = "ros-noetic-fuse-viz";
  version = "0.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fuse-release";
    rev = "3a5f1d07b01d4ef0eff9ce823c08fd88a4e7cec1";
    owner = "locusrobotics";
    sha256 = "sha256-xEwnt5HUd7AakfWEBitDW41HU5Dr6pxp2juUzfoyPiw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin qt5.qtbase ];
  checkInputs = [ roslint ];
  propagatedBuildInputs = [ eigen fuse-constraints fuse-core fuse-msgs fuse-variables geometry-msgs rviz tf2-geometry-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The fuse_viz package provides visualization tools for fuse.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
