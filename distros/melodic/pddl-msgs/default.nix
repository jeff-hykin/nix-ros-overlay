
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, message-generation, message-runtime }:
buildRosPackage {
  pname = "ros-melodic-pddl-msgs";
  version = "0.1.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_planning-release";
    rev = "57646f5d7af2ee3c66da949515c9637582e25c2f";
    owner = "tork-a";
    sha256 = "sha256-HOobPtLZFrdyKUg0AjVkxHy4X0pI7EJhhlcxO4v0V4I=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib actionlib-msgs message-runtime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''message for pddl planner'';
    license = with lib.licenses; [ asl20 ];
  };
}
