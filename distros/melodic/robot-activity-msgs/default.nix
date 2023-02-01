
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-robot-activity-msgs";
  version = "0.1.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_activity-release";
    rev = "bafcb626eb5d7a21d9ca129e2bcfb5a0ce1760d9";
    owner = "snt-robotics";
    sha256 = "sha256-sBgY9FBXZ6gUi/VqwgLf5unTPcJ10Uq7UPUXa8Mc3iE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ message-generation message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains messages used by robot_activity, such as node's state
    and error'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
