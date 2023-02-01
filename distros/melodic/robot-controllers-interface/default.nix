
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, pluginlib, robot-controllers-msgs, roscpp }:
buildRosPackage {
  pname = "ros-melodic-robot-controllers-interface";
  version = "0.6.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_controllers-release";
    rev = "6509541ae6cf86ee3fb3d380b743d10488d5700d";
    owner = "fetchrobotics-gbp";
    sha256 = "sha256-dOR7btAmG3Y40avAVqBAaXwgHhZnJg9bke6nYwkXHNs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib pluginlib robot-controllers-msgs roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Generic framework for robot controls.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
