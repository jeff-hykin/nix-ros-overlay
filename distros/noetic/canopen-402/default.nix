
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, canopen-master, catkin, class-loader, rosunit }:
buildRosPackage {
  pname = "ros-noetic-canopen-402";
  version = "0.8.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_canopen-release";
    rev = "c1842e28b2b1fa7bf45d6ab7b9974b5818478ac0";
    owner = "ros-industrial-release";
    sha256 = "sha256-ayRBz0+Ikxjluz1EbD7/5sE0ls47EQXFZwdRG8x6OLg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ canopen-master class-loader ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This implements the CANopen device profile for drives and motion control. CiA(r) 402'';
    license = with lib.licenses; [ lgpl3Only ];
  };
}
