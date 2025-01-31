
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, roscpp, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-rsm-msgs";
  version = "1.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_statemachine-release";
    rev = "eaeaf0bb2b65380873e9a0fbd42850a02a88edf3";
    owner = "MarcoStb1993";
    sha256 = "sha256-Q7qyM9yy8vq8CkddDlQCzL4hhmuqtDuRu50eYs+ksAQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rsm_msgs package features messages and services for the Robot Statemachine'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
