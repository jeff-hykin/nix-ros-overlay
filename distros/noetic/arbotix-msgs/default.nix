
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-arbotix-msgs";
  version = "0.11.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "arbotix_ros-release";
    rev = "741eb698d907e9bd8ee968104f1970397e1b075b";
    owner = "vanadiumlabs";
    sha256 = "sha256-SE0mMZCdJfHPND1Z5SlCWqL9GV4//SvB5Zw0abfMpks=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages and Services definitions for the ArbotiX.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
