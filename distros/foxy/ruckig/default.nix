
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake }:
buildRosPackage {
  pname = "ros-foxy-ruckig";
  version = "0.9.2-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "pantor";
        repo = "ruckig-release";
        rev = "release/foxy/ruckig/0.9.2-1";
        sha256 = "sha256-xzv0PejVB2frTXtd7fnF72E49MOQaARx6boGHYzyVnQ=";
      };

  buildType = "cmake";
  buildInputs = [ cmake ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Instantaneous Motion Generation for Robots and Machines.'';
    license = with lib.licenses; [ mit ];
  };
}
