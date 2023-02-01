
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake }:
buildRosPackage {
  pname = "ros-humble-osrf-testing-tools-cpp";
  version = "1.5.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "osrf_testing_tools_cpp-release";
    rev = "9ed6c1929ba2c9ad896e898dc92f3d0aaf758ae6";
    owner = "ros2-gbp";
    sha256 = "sha256-du4lfHqdmHOrL+pPJsvjMzkstRUrj//VqIabWR6SP2Y=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Testing tools for C++, and is used in various OSRF projects.'';
    license = with lib.licenses; [ asl20 ];
  };
}
