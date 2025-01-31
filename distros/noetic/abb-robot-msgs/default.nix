
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-abb-robot-msgs";
  version = "0.5.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "abb_robot_driver_interfaces-release";
    rev = "06a446022237f8235efa975d6b8b62728f796226";
    owner = "ros-industrial-release";
    sha256 = "sha256-DWW0KNFYO80EHowJZF5XABykmf2ksQ/Z22fvPSSPaGQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ message-generation message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Provides ROS message and service definitions, representing basic interaction with ABB robot controllers.'';
    license = with lib.licenses; [ bsd3 ];
  };
}
