
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-volta-base";
  version = "1.2.0-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "botsync-gbp";
        repo = "volta-release";
        rev = "release/noetic/volta_base/1.2.0-1";
        sha256 = "sha256-f2ApjQAJzjhiLkJsCXSRyxuOBG/l50iEUMN1PmaVgyw=";
      };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The volta_base package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
