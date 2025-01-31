
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake, doxygen, dynamic-graph, dynamic-graph-python, pinocchio }:
buildRosPackage {
  pname = "ros-melodic-sot-core";
  version = "4.11.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "sot-core-ros-release";
    rev = "92d0a93d7a1aac79d82e60899431bc3e9093548f";
    owner = "stack-of-tasks";
    sha256 = "sha256-RoSn5VvD331uV4bz3XkozgcfkIBtLhrzwvvCueyL/Fo=";
  };

  buildType = "cmake";
  buildInputs = [ cmake doxygen ];
  propagatedBuildInputs = [ boost catkin dynamic-graph dynamic-graph-python pinocchio ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Hierarchical task solver plug-in for dynamic-graph'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
