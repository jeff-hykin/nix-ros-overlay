
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, nav-msgs, rm-common, rm-msgs, roscpp, roslint, sensor-msgs, serial, std-msgs, tf2-geometry-msgs }:
buildRosPackage {
  pname = "ros-noetic-rm-referee";
  version = "0.1.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rm_control-release";
    rev = "d84b46e9471b471b06008ff9460a1f2b94301365";
    owner = "rm-controls";
    sha256 = "sha256-WlP3nFLFbpTRRcef/sizITLZMXwiHi/Zi48MhYAiByU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib nav-msgs rm-common rm-msgs roscpp roslint sensor-msgs serial std-msgs tf2-geometry-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A template for ROS packages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
