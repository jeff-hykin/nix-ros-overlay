
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, pr2-controllers-msgs, roscpp }:
buildRosPackage {
  pname = "ros-noetic-single-joint-position-action";
  version = "1.10.18-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_controllers-release";
    rev = "4bef8cdbc5d4864755a3dbf14ad74efbd277c03d";
    owner = "pr2-gbp";
    sha256 = "sha256-xc68WcIBVKnNKoSx3fj2xDoHWxYJ0PAU9jLqxqzHp/0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib pr2-controllers-msgs roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The single joint position action is a node that provides an action
  interface for commanding a trajectory to move a joint to a particular
  position. The action reports success when the joint reaches the desired
  position.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
