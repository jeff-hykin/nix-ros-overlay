
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, cob-description, geometry-msgs, message-generation, message-runtime, moveit-msgs, pythonPackages, robot-state-publisher, roslib, rospy, rviz, schunk-description, sensor-msgs, std-msgs, tf, tf2-ros, trajectory-msgs, visualization-msgs, xacro }:
buildRosPackage {
  pname = "ros-melodic-cob-grasp-generation";
  version = "0.7.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_manipulation-release";
    rev = "09239092ee9cb3a532e8aba59e77a10e8637079c";
    owner = "ipa320";
    sha256 = "sha256-rmELLrQCFvZuknYw6c4dRaA5nuWx8UOAT/hKuqd/tg8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation pythonPackages.setuptools ];
  propagatedBuildInputs = [ actionlib actionlib-msgs cob-description geometry-msgs message-runtime moveit-msgs pythonPackages.scipy pythonPackages.six robot-state-publisher roslib rospy rviz schunk-description sensor-msgs std-msgs tf tf2-ros trajectory-msgs visualization-msgs xacro ];
  nativeBuildInputs = [ catkin pythonPackages.setuptools ];

  meta = {
    description = ''Grasp generation for Care-O-bot based on OpenRAVE'';
    license = with lib.licenses; [ asl20 ];
  };
}
