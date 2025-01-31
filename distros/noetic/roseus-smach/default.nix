
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-tutorials, catkin, euslisp, message-generation, message-runtime, roseus, rostest, smach, smach-msgs, smach-ros, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-roseus-smach";
  version = "1.7.5-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_roseus-release";
    rev = "1c5c1e45470110dc89066798a68f75900b125d59";
    owner = "tork-a";
    sha256 = "sha256-oMBE1hwOzAalZJlTz9GMSdxrlUUBMWaeNuxL5rBzQhI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib actionlib-tutorials euslisp message-runtime roseus rostest smach smach-msgs smach-ros std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''roseus_smach

     * Euslisp state machine class. it will be moved.
     * Message publisher for visualizing current state by smach_viewer.
     * Simple pickle dump script for debugging state machine.
     * Execute state machine as a action server.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
