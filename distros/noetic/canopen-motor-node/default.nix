
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, canopen-402, canopen-chain-node, canopen-master, catkin, controller-manager, controller-manager-msgs, filters, hardware-interface, joint-limits-interface, muparser, roscpp, rosunit, urdf }:
buildRosPackage {
  pname = "ros-noetic-canopen-motor-node";
  version = "0.8.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_canopen-release";
    rev = "af15376f3f463b26df16869f83d3cb326f5642f7";
    owner = "ros-industrial-release";
    sha256 = "sha256-Ixrnh1WkXt2VF0R2Ffc4IMemiq+eMXCE+x6z8OwEIWg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ canopen-402 canopen-chain-node canopen-master controller-manager controller-manager-msgs filters hardware-interface joint-limits-interface muparser roscpp urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''canopen_chain_node specialization for handling of canopen_402 motor devices. It facilitates interface abstraction with ros_control.'';
    license = with lib.licenses; [ lgpl3Only ];
  };
}
