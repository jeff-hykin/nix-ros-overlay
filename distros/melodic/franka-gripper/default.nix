
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, control-msgs, libfranka, message-generation, message-runtime, roscpp, sensor-msgs, xmlrpcpp }:
buildRosPackage {
  pname = "ros-melodic-franka-gripper";
  version = "0.10.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "franka_ros-release";
    rev = "0941f65dbdf5b31c5d1eb97a7e50e7c05dfd4949";
    owner = "frankaemika";
    sha256 = "sha256-0+LWjt71ty6lIcgby7jtYDAGWWyxV5w68nV4+9xxaIg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib actionlib-msgs control-msgs libfranka message-generation message-runtime roscpp sensor-msgs xmlrpcpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package implements the franka gripper of type Franka Hand for the use in ros'';
    license = with lib.licenses; [ asl20 ];
  };
}
