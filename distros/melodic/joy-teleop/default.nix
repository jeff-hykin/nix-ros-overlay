
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, rospy, rostopic, sensor-msgs, teleop-tools-msgs }:
buildRosPackage {
  pname = "ros-melodic-joy-teleop";
  version = "0.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "teleop_tools-release";
    rev = "1ffae8b017eb33801e9023432e485030fb93b0ef";
    owner = "ros-gbp";
    sha256 = "sha256-LK0hIHlQ1kN1zT+CvATCf0rCDdDhs0GW2ZveiuF9KGA=";
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
