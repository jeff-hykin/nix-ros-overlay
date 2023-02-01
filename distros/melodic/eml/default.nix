
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake }:
buildRosPackage {
  pname = "ros-melodic-eml";
  version = "1.8.15-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "eml-release";
    rev = "4ec7193b06f0c82c8ff271fdebd98088a85598a7";
    owner = "ros-gbp";
    sha256 = "sha256-3LM4rau+nhrhoeVcxUdszDkvoelRGEy1AikgMZud4fQ=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ catkin ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''This is an implementation of the EtherCAT master protocol for the PR2
      robot based on the work done at Flanders' Mechatronics Technology Centre.'';
    license = with lib.licenses; [ "Binary-Only" ];
  };
}
