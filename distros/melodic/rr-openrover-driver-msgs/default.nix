
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-rr-openrover-driver-msgs";
  version = "1.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rr_openrover_stack-release";
    rev = "1091146d5d488220cd246b84695441ee7f1bd613";
    owner = "RoverRobotics-release";
    sha256 = "sha256-AFJ2FE19gxF6elpeg3mAnbE5NU13vTxqJnOx5ArZvvQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rr_openrover_driver_msgs package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
