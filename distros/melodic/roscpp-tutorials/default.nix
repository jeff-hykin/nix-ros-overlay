
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, message-generation, message-runtime, rosconsole, roscpp, roscpp-serialization, rostime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-roscpp-tutorials";
  version = "0.9.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_tutorials-release";
    rev = "7fd4c3624e205c8804a8a721edcac667d83457de";
    owner = "ros-gbp";
    sha256 = "sha256-LDriqiShX0oVasXcr4Dz8QddsHudNQ8wQCcmq+n4ifY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ boost message-runtime rosconsole roscpp roscpp-serialization rostime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package attempts to show the features of ROS step-by-step,
    including using messages, servers, parameters, etc.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
