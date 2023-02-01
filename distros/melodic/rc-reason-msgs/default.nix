
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, rc-common-msgs, shape-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-rc-reason-msgs";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rc_reason_clients_ros-release";
    rev = "c4d5a0ae59565dfb15ddbe348ad053db3ca6f9ea";
    owner = "roboception-gbp";
    sha256 = "sha256-uu+5yzSLHPPvfrzC9MLUH+Q1eZcKO3nlc2ceSHXlDSU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime rc-common-msgs shape-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Msg and srv definitions for rc_reason_clients'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
