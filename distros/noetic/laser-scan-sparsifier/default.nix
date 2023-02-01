
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nodelet, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-laser-scan-sparsifier";
  version = "0.3.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "scan_tools-release";
    rev = "623dc0fc2a5a08e3fe798277ad55931dd11206a4";
    owner = "ros-gbp";
    sha256 = "sha256-ZlPQsfW2+9xFA9xEaak6OSQnAAz57RTyKezMjVL/UN0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ nodelet roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The laser_scan_sparsifier takes in a LaserScan message and sparsifies it.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
