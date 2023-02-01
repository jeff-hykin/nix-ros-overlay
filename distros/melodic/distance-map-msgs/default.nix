
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, nav-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-distance-map-msgs";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "distance_map-release";
    rev = "7dcf126dd5a8c8408eeb1b7a100ee0831bcc7c28";
    owner = "artivis";
    sha256 = "sha256-8shkyXvuEQ06HU5otmpVOjvWBQWPlyq9Y/bEDhlsABM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime nav-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Definition of the distance map message type.'';
    license = with lib.licenses; [ asl20 ];
  };
}
