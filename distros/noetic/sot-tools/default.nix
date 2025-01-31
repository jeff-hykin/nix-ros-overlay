
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake, doxygen, dynamic-graph-python, git, sot-core }:
buildRosPackage {
  pname = "ros-noetic-sot-tools";
  version = "2.3.5-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "sot-tools-ros-release";
    rev = "43410ad1f414dfd4b1453f1d9d9d214382a60df6";
    owner = "stack-of-tasks";
    sha256 = "sha256-vp+7vv4avmvUl8BdlCYnsCxkq88phbAjvdhq90gfe1U=";
  };

  buildType = "cmake";
  buildInputs = [ cmake doxygen git ];
  propagatedBuildInputs = [ catkin dynamic-graph-python sot-core ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Miscellanous entities for the stack of tasks'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
