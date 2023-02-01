
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, amcl, catkin, map-server, move-base, mpc-local-planner, mpc-local-planner-msgs, stage-ros }:
buildRosPackage {
  pname = "ros-melodic-mpc-local-planner-examples";
  version = "0.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mpc_local_planner-release";
    rev = "3306c80df4cb70225549c48cbe4d5ee2a3b1694b";
    owner = "rst-tu-dortmund";
    sha256 = "sha256-b0ah2/zKdH5K97yrriZ/Y2p+dSNrQfgD/p74fqlwT3o=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ amcl map-server move-base mpc-local-planner mpc-local-planner-msgs stage-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The mpc_local_planner_examples package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
