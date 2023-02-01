
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, pkg-config, rosbash }:
buildRosPackage {
  pname = "ros-melodic-tracetools";
  version = "0.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros1-tracetools-release";
    rev = "043770f3add566077c39d251ce7ab98b5ba2966b";
    owner = "boschresearch";
    sha256 = "sha256-rZV5DIFIOeySsNeb5rbsceSjFicuTMpXAmigknhiT7M=";
  };

  buildType = "catkin";
  buildInputs = [ boost catkin pkg-config ];
  checkInputs = [ rosbash ];
  nativeBuildInputs = [ catkin pkg-config ];

  meta = {
    description = ''Wrapper interface for tracing libraries'';
    license = with lib.licenses; [ "APLv2" ];
  };
}
