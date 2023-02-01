
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, bcap-core, catkin, message-generation, message-runtime, roscpp, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-bcap-service";
  version = "3.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "denso_robot_ros-release";
    rev = "ede541ddd8a7b2d614144f46fb98558d4da1e4fc";
    owner = "DENSORobot";
    sha256 = "sha256-iQz7RYpfb1ele/vf5atJLtOnSZZs9LrkF5UyAK1Q00A=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ bcap-core message-runtime roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The bcap service package includes a node for communicating ORiN from ROS.'';
    license = with lib.licenses; [ mit ];
  };
}
