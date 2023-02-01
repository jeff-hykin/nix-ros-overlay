
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, autoconf, catkin, git, libtool, rsync, zlib }:
buildRosPackage {
  pname = "ros-noetic-grpc";
  version = "0.0.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "catkin_grpc-release";
    rev = "d67c8c60ad9ff80b98d35e960bf3ff9415e3b445";
    owner = "CogRobRelease";
    sha256 = "sha256-h4npK4/Op3K2aEDjjThObTIozwcIh9htvPBS+IsrRWM=";
  };

  buildType = "catkin";
  buildInputs = [ autoconf catkin git libtool zlib ];
  propagatedBuildInputs = [ rsync ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Catkinized gRPC Package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
