
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, rospy }:
buildRosPackage {
  pname = "ros-noetic-key-teleop";
  version = "0.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "teleop_tools-release";
    rev = "ed01849c22ce2fc1c78387c92bbde16957751705";
    owner = "ros-gbp";
    sha256 = "sha256-oPLvwG4TGEy4+xLRlP6mvs+hc+RSxOx6r6qarS4Dy6I=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A text-based interface to send a robot movement commands'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
