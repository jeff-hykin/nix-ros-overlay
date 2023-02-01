
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, genmsg, genpy, python3Packages }:
buildRosPackage {
  pname = "ros-noetic-genmypy";
  version = "0.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "genmypy-release";
    rev = "9dce7f518ac229c551843b0a31fe8bc475b3605a";
    owner = "rospypi";
    sha256 = "sha256-hf/egLXmmmwG/ST3AlI7ljjfjFcVTtTcGeRP2FiLBQA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin python3Packages.setuptools ];
  propagatedBuildInputs = [ genmsg genpy ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''Python stub generator from genmsg specs'';
    license = with lib.licenses; [ asl20 ];
  };
}
