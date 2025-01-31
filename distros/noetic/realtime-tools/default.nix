
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, roscpp, rostest, rosunit }:
buildRosPackage {
  pname = "ros-noetic-realtime-tools";
  version = "1.16.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "realtime_tools-release";
    rev = "51f3b31b7cf5b7c9fd4c34f63c8c380c27980d8a";
    owner = "ros-gbp";
    sha256 = "sha256-ISjU/Pn5myVjhFdt3FPDjx4dkPdjOdk5FdnP1sQyQmc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ actionlib rostest rosunit ];
  propagatedBuildInputs = [ actionlib roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Contains a set of tools that can be used from a hard
    realtime thread, without breaking the realtime behavior.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
