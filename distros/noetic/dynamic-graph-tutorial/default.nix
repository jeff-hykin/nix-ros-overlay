
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake, doxygen, dynamic-graph, dynamic-graph-python, git }:
buildRosPackage {
  pname = "ros-noetic-dynamic-graph-tutorial";
  version = "1.3.5-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dynamic-graph-tutorial-ros-release";
    rev = "c363c365c5316a5a9dbbe69419dc018ef59de3dc";
    owner = "stack-of-tasks";
    sha256 = "sha256-rOFY1AaSzYzpQL/1QUIZikgpJtCS4Vl8imSm6bpZuoc=";
  };

  buildType = "cmake";
  buildInputs = [ cmake doxygen dynamic-graph dynamic-graph-python git ];
  propagatedBuildInputs = [ boost catkin ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Dynamic graph tutorial'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
