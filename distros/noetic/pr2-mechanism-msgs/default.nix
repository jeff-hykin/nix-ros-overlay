
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-pr2-mechanism-msgs";
  version = "1.8.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_mechanism_msgs-release";
    rev = "b9ac68214d05bacbb8fe55ca2c82f52fc578b6ae";
    owner = "ros-gbp";
    sha256 = "sha256-eKaRMpfyKkOAMpTlbgQIZFfrLdgbFGwnpWQxLqruhjY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib-msgs message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package defines services that are used to communicate with
     the realtime control loop. It also defines messages
     that represent the state of the realtime controllers, the joints
     and the actuators.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
