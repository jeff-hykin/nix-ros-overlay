
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, can-msgs, catkin, rosconsole-bridge, roscpp, roslint, rostest, rosunit, socketcan-interface }:
buildRosPackage {
  pname = "ros-noetic-socketcan-bridge";
  version = "0.8.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_canopen-release";
    rev = "71f8997823621df2eea8225924a6dd6de79bf776";
    owner = "ros-industrial-release";
    sha256 = "sha256-TROokf77eTUmXExRuRlqkfntVP7pHuGrmI6hqVLosnc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint rostest rosunit ];
  propagatedBuildInputs = [ can-msgs rosconsole-bridge roscpp socketcan-interface ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Conversion nodes for messages from SocketCAN to a ROS Topic and vice versa.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
