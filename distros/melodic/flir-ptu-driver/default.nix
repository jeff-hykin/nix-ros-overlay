
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, boost, catkin, diagnostic-updater, flir-ptu-description, robot-state-publisher, roscpp, roslaunch, roslint, rospy, sensor-msgs, serial, tf }:
buildRosPackage {
  pname = "ros-melodic-flir-ptu-driver";
  version = "0.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "flir_ptu-release";
    rev = "cb2b15a7345f4751253d572cda25443e7ebbb267";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-BTYZwED8SKskEn8kXFXOArZQ8f4oAVUZt/0x3WC11sY=";
  };

  buildType = "catkin";
  buildInputs = [ boost catkin roslaunch roslint ];
  propagatedBuildInputs = [ actionlib diagnostic-updater flir-ptu-description robot-state-publisher roscpp rospy sensor-msgs serial tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Driver for the FLIR pan/tilt units.'';
    license = with lib.licenses; [ "GPL" ];
  };
}
