
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-fetch-maps";
  version = "0.9.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fetch_ros-release";
    rev = "59f3eeb15be7928931ec07fe2ac4143553fcf5b3";
    owner = "fetchrobotics-gbp";
    sha256 = "sha256-Vz/V1nh53BKPB/EWB3sjHFp+tc7XVHdd1V1M+eYAbzA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The fetch_maps package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
