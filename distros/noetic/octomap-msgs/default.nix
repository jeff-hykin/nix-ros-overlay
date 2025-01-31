
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-octomap-msgs";
  version = "0.3.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "octomap_msgs-release";
    rev = "f820fed2543e333b8b15ce591ef92c675052adf9";
    owner = "ros-gbp";
    sha256 = "sha256-XBb//PZ07P6FEL1E8wNjH94EWn/NQMoxkJyppXazT7Q=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides messages and serializations / conversion for the <a href="http://octomap.github.io">OctoMap library</a>.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
