
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pilz-extensions, pilz-robot-programming, pilz-trajectory-generation }:
buildRosPackage {
  pname = "ros-melodic-pilz-industrial-motion";
  version = "0.4.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pilz_industrial_motion-release";
    rev = "7ab6bba9b46493fae069409b2327232a34de94f0";
    owner = "PilzDE";
    sha256 = "sha256-AcPS9BU0LBfZpJBUGP0JAZdGHfsl7V3L2HEQbxh5l6E=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pilz-extensions pilz-robot-programming pilz-trajectory-generation ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pilz_industrial_motion package'';
    license = with lib.licenses; [ asl20 ];
  };
}
