
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake, doxygen, dynamic-graph-python, git, sot-core }:
buildRosPackage {
  pname = "ros-melodic-sot-tools";
  version = "2.3.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "sot-tools-ros-release";
    rev = "01cf37d93be79efa29f2bb8567e093cafab1d066";
    owner = "stack-of-tasks";
    sha256 = "sha256-N/8HZvhmtQfqtXs82gGjbH5pfnr6+ODZCqcCL0aVVm0=";
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
