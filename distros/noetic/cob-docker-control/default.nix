
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-cob-docker-control";
  version = "0.6.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_substitute-release";
    rev = "6491eb764f896b17a0a47911933d1547afbc72e2";
    owner = "ipa320";
    sha256 = "sha256-xC6P2ZkXr0vm54AMqNieRy4OYhcaGgDLOvE9wTEZrCY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Autonomous docking'';
    license = with lib.licenses; [ asl20 ];
  };
}
