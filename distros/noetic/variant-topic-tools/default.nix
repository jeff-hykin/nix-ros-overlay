
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, gtest, roscpp, roslib, std-msgs, variant-msgs }:
buildRosPackage {
  pname = "ros-noetic-variant-topic-tools";
  version = "0.1.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "variant-release";
    rev = "6c57dc0b16285636bbcbe156495bfaaa03055154";
    owner = "anybotics";
    sha256 = "sha256-aXS5Fb1EdHRYRVJoyxvJJH5PFfvjfPPlo24AgSwYjeY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ geometry-msgs gtest std-msgs ];
  propagatedBuildInputs = [ roscpp roslib variant-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Topic tools for treating messages as variant types.'';
    license = with lib.licenses; [ "GNU-Lesser-General-Public-License-LGPL-" ];
  };
}
