
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, geometry-msgs, message-generation, message-runtime, roscpp, rospy, rostest, tf, tf2-ros }:
buildRosPackage {
  pname = "ros-noetic-tf2-web-republisher";
  version = "0.3.2-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tf2_web_republisher-release";
    rev = "c64d591897edc89338b899458d3a922e0854630e";
    owner = "RobotWebTools-release";
    sha256 = "sha256-SWlALJIr/iyDp2Qh1Vw6fk7oq1AHzE3I3b2ysTWrbWU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  checkInputs = [ rospy rostest ];
  propagatedBuildInputs = [ actionlib actionlib-msgs geometry-msgs message-runtime roscpp tf tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Republishing of Selected TFs'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
