
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-ainstein-radar-msgs";
  version = "2.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ainstein_radar-release";
    rev = "5be21f7d463e36e537cf2c5fed8c8c83e0275e11";
    owner = "AinsteinAI";
    sha256 = "sha256-s40ZRBXvy+pif95Wx8nKb1BGqn2nJBxA+9PEsJcwgKA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS message definitions for Ainstein radars.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
