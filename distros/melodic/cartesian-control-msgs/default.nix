
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, geometry-msgs, message-generation, message-runtime }:
buildRosPackage {
  pname = "ros-melodic-cartesian-control-msgs";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "Universal_Robots_ROS_cartesian_control_msgs-release";
    rev = "fb956860d6c5b8cdcd25fe2158a5532e9519bcbf";
    owner = "UniversalRobots";
    sha256 = "sha256-uPW2h5O83C0HDN+7KJPJyMYjI3+bCHV9PPDf2bqI1ys=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib-msgs geometry-msgs message-runtime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Cartesian trajectory execution interface.'';
    license = with lib.licenses; [ asl20 ];
  };
}
