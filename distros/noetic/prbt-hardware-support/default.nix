
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, canopen-chain-node, catkin, cmake-modules, code-coverage, dynamic-reconfigure, libmodbus, message-filters, message-generation, message-runtime, pilz-msgs, pilz-testutils, pilz-utils, roscpp, rosservice, rostest, rosunit, sensor-msgs, std-msgs, std-srvs, tf2, tf2-geometry-msgs, tf2-ros, urdf }:
buildRosPackage {
  pname = "ros-noetic-prbt-hardware-support";
  version = "0.6.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pilz_robots-release";
    rev = "5255690c87bca5d4daad6a1157cc33e2196d5646";
    owner = "PilzDE";
    sha256 = "sha256-w3OZdXBw+WGya20pRJFKmBmpSwVJ7YIvD7LhfkN12VI=";
  };

  buildType = "catkin";
  buildInputs = [ canopen-chain-node catkin dynamic-reconfigure libmodbus message-filters message-generation pilz-utils tf2 tf2-geometry-msgs tf2-ros urdf ];
  checkInputs = [ cmake-modules code-coverage pilz-testutils rostest rosunit ];
  propagatedBuildInputs = [ message-runtime pilz-msgs roscpp rosservice sensor-msgs std-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Control hardware functions of the PRBT manipulator like RUN_PERMITTED for Stop1 functionality.'';
    license = with lib.licenses; [ lgpl3Only ];
  };
}
