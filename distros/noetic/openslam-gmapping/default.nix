
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-openslam-gmapping";
  version = "0.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "openslam_gmapping-release";
    rev = "d94b4d280ba29de1e9f519b1ea80b42a2d7cdbe0";
    owner = "ros-gbp";
    sha256 = "sha256-MUgh9i3a5ePHLcN+RO5D6R++QoGZdURh+t8diGdkZys=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The catkinized verseion of openslam_gmapping package (https://github.com/OpenSLAM-org/openslam_gmapping/tree/79ef0b0e6d9a12d6390ae64c4c00d37d776abefb)'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
