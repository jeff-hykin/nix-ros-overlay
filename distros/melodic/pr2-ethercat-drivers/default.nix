
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ethercat-hardware, fingertip-pressure }:
buildRosPackage {
  pname = "ros-melodic-pr2-ethercat-drivers";
  version = "1.8.19-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_ethercat_drivers-release";
    rev = "c38a632e2be2f5429d1d1c8521420b63725d508e";
    owner = "pr2-gbp";
    sha256 = "sha256-r1MeAlPCfV4MoETZWjitUCHgX44l3PQL/tjAsuoHF6A=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ethercat-hardware fingertip-pressure ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This stack contains drivers for the ethercat system and the peripherals
    that connect to it: motor control boards, fingertip sensors, texture
    projector, hand accelerometer.'';
    license = with lib.licenses; [ bsdOriginal "GPL" ];
  };
}
