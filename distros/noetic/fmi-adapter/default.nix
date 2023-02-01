
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, git, roscpp, rostest, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-fmi-adapter";
  version = "1.0.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fmi_adapter-release";
    rev = "ebabc0691f1083e87d45e2199032550cc6a6646a";
    owner = "boschresearch";
    sha256 = "sha256-T/tOGSBZxproguefC+sHfBgs3Zl7GOieHXdo5n8jigM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin git ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Wraps FMUs for co-simulation'';
    license = with lib.licenses; [ asl20 ];
  };
}
