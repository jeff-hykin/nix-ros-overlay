
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-dev, gazebo-ros, geographic-msgs, joy, joy-teleop, message-runtime, protobuf, std-msgs, wamv-gazebo, wave-gazebo, xacro }:
buildRosPackage {
  pname = "ros-melodic-vrx-gazebo";
  version = "1.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "vrx-release";
    rev = "c83319ef2796a4ed48c554c94f24d55f1a0ff0bd";
    owner = "ros-gbp";
    sha256 = "sha256-Y4eTMMtXI5MJ60cfL3xBuWaPKWfqDWeeyQZsqQZO/bQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin protobuf ];
  propagatedBuildInputs = [ gazebo-dev gazebo-ros geographic-msgs joy joy-teleop message-runtime std-msgs wamv-gazebo wave-gazebo xacro ];
  nativeBuildInputs = [ catkin protobuf ];

  meta = {
    description = ''The ROS package for the RobotX competition running in Gazebo.'';
    license = with lib.licenses; [ asl20 ];
  };
}
