
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, genmsg, geometry-msgs, message-generation, message-runtime, nav-msgs, sensor-msgs, std-msgs, trajectory-msgs }:
buildRosPackage {
  pname = "ros-melodic-naoqi-bridge-msgs";
  version = "0.0.8";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "naoqi_bridge_msgs-release";
    rev = "d244572a792f7f204a437fc3c6ab9825b4f01203";
    owner = "ros-naoqi";
    sha256 = "sha256-CZQPLxbTD19VT0vOSapXaPuEOFJWqEGi9/KQSW0MjJE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib-msgs genmsg geometry-msgs message-runtime nav-msgs sensor-msgs std-msgs trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The naoqi_bridge_msgs package provides custom messages for running Aldebaran's robot such as NAO and Pepper. See the packages nao_robot and pepper_robot for details.'';
    license = with lib.licenses; [ asl20 ];
  };
}
