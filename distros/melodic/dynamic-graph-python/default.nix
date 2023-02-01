
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake, doxygen, dynamic-graph, eigen, eigenpy, git, python, pythonPackages }:
buildRosPackage {
  pname = "ros-melodic-dynamic-graph-python";
  version = "4.0.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dynamic-graph-python-ros-release";
    rev = "82bec9a490dc183fb2faf859577e2e3241a05e72";
    owner = "stack-of-tasks";
    sha256 = "sha256-eYwanDYP9SIMHeP5L6JLHIL8XUPkCf3k8IntZv0mWOM=";
  };

  buildType = "cmake";
  buildInputs = [ cmake doxygen git ];
  propagatedBuildInputs = [ boost catkin dynamic-graph eigen eigenpy python pythonPackages.numpy ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Dynamic graph library Python bindings'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
