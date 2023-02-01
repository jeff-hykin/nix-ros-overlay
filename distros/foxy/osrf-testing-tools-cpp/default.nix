
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake }:
buildRosPackage {
  pname = "ros-foxy-osrf-testing-tools-cpp";
  version = "1.3.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "osrf_testing_tools_cpp-release";
    rev = "db0390ead6c98fb7d5bc6490dd98fabc76f7349d";
    owner = "ros2-gbp";
    sha256 = "sha256-ytnit3gdJ5NLEyG9QvEsrANMyBG5X3mDn8z4JZ98uzU=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Testing tools for C++, and is used in various OSRF projects.'';
    license = with lib.licenses; [ asl20 ];
  };
}
