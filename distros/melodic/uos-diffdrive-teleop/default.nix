
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, ps3joy, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-uos-diffdrive-teleop";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uos-tools";
    rev = "840fca22ee158a7694d33a5d0b701d8b65677e4c";
    owner = "uos-gbp";
    sha256 = "sha256-AAqcaABGMJxmizt9vR7HhYEbBlzRCcOACiXMA45FatM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs ps3joy roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''uos_diffdrive_teleop'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
