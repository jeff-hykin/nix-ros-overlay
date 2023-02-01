
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, bison, cmake, cunit, iceoryx-binding-c, iceoryx-posh, iceoryx-utils, openssl }:
buildRosPackage {
  pname = "ros-galactic-cyclonedds";
  version = "0.8.0-r6";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cyclonedds-release";
    rev = "c6c99825bf981c1a37ac380aff46f05800606056";
    owner = "ros2-gbp";
    sha256 = "sha256-XzjKbGJHgWwujcYGTvD8yJoYr/lynDp2jDjUj42u3UI=";
  };

  buildType = "cmake";
  buildInputs = [ bison cmake ];
  checkInputs = [ cunit ];
  propagatedBuildInputs = [ iceoryx-binding-c iceoryx-posh iceoryx-utils openssl ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Eclipse Cyclone DDS is a very performant and robust open-source DDS implementation. Cyclone DDS is developed completely in the open as an Eclipse IoT project.'';
    license = with lib.licenses; [ "EPL-2.0" "Eclipse-Distribution-License-1.0" ];
  };
}
