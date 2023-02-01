
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, multisense-description, multisense-ros }:
buildRosPackage {
  pname = "ros-noetic-multisense-bringup";
  version = "4.0.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "multisense_ros-release";
    rev = "0bbcfecee8d5b3ae07a3967e037132fc5170fcd9";
    owner = "carnegieroboticsllc";
    sha256 = "sha256-aAqxaT4IyBLLiFtdUzPlbUpJU8B/AMdpVtaXOTj/MzE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ multisense-description multisense-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''multisense_bringup'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
