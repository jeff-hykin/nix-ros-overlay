
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, git, ros-environment }:
buildRosPackage {
  pname = "ros-noetic-osqp-vendor";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "osqp_vendor-release";
    rev = "9fcdf01fa12e5ee9f1a843f1fe3ba553d3258acd";
    owner = "tier4";
    sha256 = "sha256-I6jhthmRppj6fiDd1M+bbW8W/bsR5/0ur5UWcf4/ZGQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin git ros-environment ];
  nativeBuildInputs = [ catkin git ];

  meta = {
    description = ''Wrapper around osqp that ships with a CMake module'';
    license = with lib.licenses; [ asl20 ];
  };
}
