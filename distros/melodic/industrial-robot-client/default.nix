
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, control-msgs, industrial-msgs, industrial-utils, robot-state-publisher, roscpp, roslaunch, rosunit, sensor-msgs, simple-message, std-msgs, trajectory-msgs, urdf }:
buildRosPackage {
  pname = "ros-melodic-industrial-robot-client";
  version = "0.7.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "industrial_core-release";
    rev = "b180c6e78ffc4aa4efe27d9f34aa9d964732a902";
    owner = "ros-industrial-release";
    sha256 = "sha256-LgvtZfdDxAZjIa9OvxJbl+lOHxfAiz5mJiMScB1qf2k=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rosunit ];
  propagatedBuildInputs = [ actionlib actionlib-msgs control-msgs industrial-msgs industrial-utils robot-state-publisher roscpp sensor-msgs simple-message std-msgs trajectory-msgs urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''industrial robot client contains generic clients for connecting 
     to industrial robot controllers with servers that adhere to the
     simple message protocol.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
