
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-power-msgs";
  version = "0.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "power_msgs-release";
    rev = "4c0ef1643b3d3385186205f055d25f44e4d70164";
    owner = "fetchrobotics-gbp";
    sha256 = "sha256-QvZ5QmO3r+aHuScvApVtJBeMy9z8HwfEc0jhtBR40PY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS messages for power measurement and breaker control.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
