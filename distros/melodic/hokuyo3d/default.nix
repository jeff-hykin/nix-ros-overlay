
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, roslint, rostest, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-hokuyo3d";
  version = "0.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hokuyo3d-release";
    rev = "12de6a94ca5515e8a1d6b2b653e45c7db86b4ba3";
    owner = "at-wat";
    sha256 = "sha256-t+5kRJKbUQzoRqYHAh4k+jbBqOcuy0m+se8tSXCtpNM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslint rostest ];
  propagatedBuildInputs = [ roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS driver node for HOKUYO 3D LIDARs'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
