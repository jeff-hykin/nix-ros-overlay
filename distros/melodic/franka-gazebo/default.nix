
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, boost-sml, catkin, control-msgs, control-toolbox, controller-interface, controller-manager, eigen-conversions, franka-example-controllers, franka-gripper, franka-hw, franka-msgs, gazebo-dev, gazebo-ros, gazebo-ros-control, geometry-msgs, gtest, hardware-interface, joint-limits-interface, kdl-parser, pluginlib, roscpp, roslaunch, rospy, rostest, sensor-msgs, std-msgs, transmission-interface, urdf }:
buildRosPackage {
  pname = "ros-melodic-franka-gazebo";
  version = "0.10.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "franka_ros-release";
    rev = "bde253a3e05e5ee2d4936a3928b8f344a940b829";
    owner = "frankaemika";
    sha256 = "sha256-k+tSmXZZuPT/sdvNLNfR3TPRUgf7LXFvjHsZpz8Ktm4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin gazebo-dev ];
  checkInputs = [ geometry-msgs gtest rostest sensor-msgs ];
  propagatedBuildInputs = [ angles boost-sml control-msgs control-toolbox controller-interface controller-manager eigen-conversions franka-example-controllers franka-gripper franka-hw franka-msgs gazebo-ros gazebo-ros-control hardware-interface joint-limits-interface kdl-parser pluginlib roscpp roslaunch rospy std-msgs transmission-interface urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package offers the FrankaHWSim Class to simulate a Franka Robot in Gazebo'';
    license = with lib.licenses; [ asl20 ];
  };
}
