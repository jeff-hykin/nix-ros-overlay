
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros, ruby, wave-gazebo-plugins, xacro }:
buildRosPackage {
  pname = "ros-melodic-wave-gazebo";
  version = "1.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "vrx-release";
    rev = "89bbf486903b84c0fd543a6b130f3901f6cac6fa";
    owner = "ros-gbp";
    sha256 = "sha256-BuV7qRwgpiXq8afG3wi6Ws3syjBnq3YXBNcZ8f4KVY8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ruby ];
  propagatedBuildInputs = [ gazebo-ros wave-gazebo-plugins xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains Gazebo media, models and worlds for simulating
    water waves and dynamics for surface vessels. There are ROS 
    launch scripts that may be used to launch a Gazebo session and
    load a world and models using `roslaunch`.'';
    license = with lib.licenses; [ "TBD" ];
  };
}
