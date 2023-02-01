
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-catch2, eigen, rmf-battery, rmf-cmake-uncrustify, rmf-utils }:
buildRosPackage {
  pname = "ros-galactic-rmf-task";
  version = "1.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_task-release";
    rev = "6cbece379f4d374fe5104ac9e094d935548433a8";
    owner = "ros2-gbp";
    sha256 = "sha256-At3ymxuK3gLiTpAVhq6igu0xldP+G2bzoGzefU1J8fc=";
  };

  buildType = "cmake";
  checkInputs = [ ament-cmake-catch2 rmf-cmake-uncrustify ];
  propagatedBuildInputs = [ eigen rmf-battery rmf-utils ];

  meta = {
    description = ''Package for managing tasks in the Robotics Middleware Framework'';
    license = with lib.licenses; [ asl20 ];
  };
}
