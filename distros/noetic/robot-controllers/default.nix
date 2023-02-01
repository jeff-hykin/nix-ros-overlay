
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, angles, catkin, control-msgs, geometry-msgs, kdl-parser, nav-msgs, orocos-kdl, pluginlib, robot-controllers-interface, roscpp, sensor-msgs, std-msgs, tf, tf-conversions, trajectory-msgs, urdf }:
buildRosPackage {
  pname = "ros-noetic-robot-controllers";
  version = "0.7.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_controllers-release";
    rev = "becc1ff445289bbc8b8fb10215357395e63b845b";
    owner = "fetchrobotics-gbp";
    sha256 = "sha256-5nzlD8HXfSOZxRf5rsmQAJ9K29EXFtJ9c/5u+C591ck=";
  };

  buildType = "catkin";
  buildInputs = [ angles catkin ];
  propagatedBuildInputs = [ actionlib actionlib-msgs control-msgs geometry-msgs kdl-parser nav-msgs orocos-kdl pluginlib robot-controllers-interface roscpp sensor-msgs std-msgs tf tf-conversions trajectory-msgs urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Some basic robot controllers for use with robot_controllers_interface.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
