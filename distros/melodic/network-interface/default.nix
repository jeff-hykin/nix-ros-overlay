
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, roslint, rosunit, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-network-interface";
  version = "2.1.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "network_interface-release";
    rev = "7f2eb931756cf9984eb60b1b54a3b70c71c6c62b";
    owner = "astuff";
    sha256 = "sha256-IOievWM1ctUQGDtBnjvxLeDP2AwBeqvrV3XWlSUNq84=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation roslint ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Network interfaces and messages.'';
    license = with lib.licenses; [ mit ];
  };
}
