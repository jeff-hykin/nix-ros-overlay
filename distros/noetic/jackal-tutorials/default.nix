
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosdoc-lite }:
buildRosPackage {
  pname = "ros-noetic-jackal-tutorials";
  version = "0.8.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jackal-release";
    rev = "08921b7080ccec037edea7f77042d74b5c435f6c";
    owner = "clearpath-gbp";
    sha256 = "sha256-p2X2a88dgDVSHvy2b19TEou8mbtFNIF5UuuycJrboAc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin rosdoc-lite ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Jackal's tutorials.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
