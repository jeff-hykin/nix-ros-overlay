
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, rospy, rostopic, sensor-msgs, teleop-tools-msgs }:
buildRosPackage {
  pname = "ros-noetic-joy-teleop";
  version = "0.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "teleop_tools-release";
    rev = "61abe15cd7881e66b5d152e64c9e29a5b9ab9785";
    owner = "ros-gbp";
    sha256 = "sha256-Zg9siLvtC3jaPqI0EO64Kg1lNwI/4TCpd7ICdSQ4p+k=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib rospy rostopic sensor-msgs teleop-tools-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A (to be) generic joystick interface to control a robot'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
