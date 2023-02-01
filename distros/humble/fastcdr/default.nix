
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake }:
buildRosPackage {
  pname = "ros-humble-fastcdr";
  version = "1.0.24-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fastcdr-release";
    rev = "af820fd8dc61ca02e5d5a6b9abb90f2b8a4de818";
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
