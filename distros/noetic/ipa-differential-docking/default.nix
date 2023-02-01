
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-ipa-differential-docking";
  version = "0.6.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_substitute-release";
    rev = "7691c64468b0a4486111b924e2e3f15f9824e69f";
    owner = "ipa320";
    sha256 = "sha256-TqmliUUeFMSe5CuXxxBCnX2nhJJltPS2v1tzmA+P/HE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package is a substitute for the private implementation of ipa_differential_docking package'';
    license = with lib.licenses; [ asl20 ];
  };
}
