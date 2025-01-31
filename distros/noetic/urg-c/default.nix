
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-urg-c";
  version = "1.0.405-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "urg_c-release";
    rev = "d9581a61aec74f2583d070dce6af2b6b3a090407";
    owner = "ros-gbp";
    sha256 = "sha256-wEtV8auslEcnhmACa0SvoVopTV4FKwss35VKw95wxP0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The urg_c package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
