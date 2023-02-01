
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, control-msgs, industrial-msgs, industrial-robot-client, python3Packages, roslaunch, rospy, sensor-msgs, trajectory-msgs }:
buildRosPackage {
  pname = "ros-noetic-industrial-robot-simulator";
  version = "0.7.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "industrial_core-release";
    rev = "83fb22c9e81bd0c4c1e2e4481f91a7fbb239e90a";
    owner = "ros-industrial-release";
    sha256 = "sha256-oYT+ady9spoNwZ6DmC3djlPcdjo8n/W6uxh/mn0VMeE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch ];
  propagatedBuildInputs = [ control-msgs industrial-msgs industrial-robot-client python3Packages.rospkg rospy sensor-msgs trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The industrial robot simulator is a stand in for industrial robot driver node(s).  It adheres to the driver specification for industrial robot controllers.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
