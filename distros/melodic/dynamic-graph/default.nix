
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake, doxygen, eigen, git, graphviz }:
buildRosPackage {
  pname = "ros-melodic-dynamic-graph";
  version = "4.4.3-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dynamic-graph-ros-release";
    rev = "b4cfa8bd0331bcd18fef0ed7c4aaecc1580be469";
    owner = "stack-of-tasks";
    sha256 = "sha256-ZjYVYmbMDjUMw0P7+KODSEEm94FSWSkq9bG/x6JNFYY=";
  };

  buildType = "cmake";
  buildInputs = [ cmake doxygen git ];
  propagatedBuildInputs = [ boost catkin eigen graphviz ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Dynamic graph library'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
