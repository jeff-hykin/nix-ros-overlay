
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake }:
buildRosPackage {
  pname = "ros-rolling-fastcdr";
  version = "1.0.24-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fastcdr-release";
    rev = "9e0f90cf5f6586e70e627b6fc69aa67ba874c1e1";
    owner = "ros2-gbp";
    sha256 = "sha256-c3xN1mu7qNZyR0MBb923pa0a69z/QGvWtYRN6aJtDq4=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''CDR serialization implementation.'';
    license = with lib.licenses; [ asl20 ];
  };
}
