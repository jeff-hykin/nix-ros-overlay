
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-copernicus-base";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "copernicus-release";
    rev = "744d0046ef6b7df01f492be4703301a4766e2c0d";
    owner = "botsync-gbp";
    sha256 = "sha256-mEhmB28IMJwzDcNUJDuKISHIeSNMIAg/88344nGzIj4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The copernicus_base package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
