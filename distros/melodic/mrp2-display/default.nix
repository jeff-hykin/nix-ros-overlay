
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, roscpp, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-mrp2-display";
  version = "0.2.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrp2_robot-release";
    rev = "9a98fd67992e32e4f53cd15004835cc3efe3c6ea";
    owner = "milvusrobotics";
    sha256 = "sha256-YxjXTVtEzNHqiIJvBhlwK8ywPs5w1iUegc33r8nmWOQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime roscpp rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package for managing touch LCD panel on MRP2'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
