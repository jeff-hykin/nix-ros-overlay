
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, joy, roscpp, roslaunch, roslint, rostest, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-teleop-twist-joy";
  version = "0.1.3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "teleop_twist_joy-release";
    rev = "99c0a6bfdbaea1805704427ae356ee385d591688";
    owner = "ros-teleop";
    sha256 = "sha256-7hNsyJOqpGjAJufLvI+K2teBHZfVDfeKBX5eOTYoJY0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslaunch roslint rostest ];
  propagatedBuildInputs = [ geometry-msgs joy roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Generic joystick teleop for twist robots.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
