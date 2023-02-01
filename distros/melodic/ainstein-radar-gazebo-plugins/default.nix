
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ainstein-radar-msgs, catkin, gazebo-plugins, gazebo-ros, roscpp }:
buildRosPackage {
  pname = "ros-melodic-ainstein-radar-gazebo-plugins";
  version = "2.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ainstein_radar-release";
    rev = "b00804f7703ccfcfecf4356a2201f3c853a78268";
    owner = "AinsteinAI";
    sha256 = "sha256-7hvkmVsg6cvLQ2veTXSVWlarl4D4vmQd04grZggyehM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ainstein-radar-msgs gazebo-plugins gazebo-ros roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Radar sensor plugins for the Gazebo simulator.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
