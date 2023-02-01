
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-mpc-local-planner-msgs";
  version = "0.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mpc_local_planner-release";
    rev = "f0d0807b3b5bfd86308c4a42db34a2a1227e7ef4";
    owner = "rst-tu-dortmund";
    sha256 = "sha256-6FOcckDTHzwh756Pq/lfuT0de+nfgGD8Y+MA+VqEoDk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides message types that are used by the package mpc_local_planner'';
    license = with lib.licenses; [ gpl3Only ];
  };
}
