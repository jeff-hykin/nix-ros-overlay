
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, moveit-core, nlopt, pluginlib, roscpp, tf-conversions, trac-ik-lib }:
buildRosPackage {
  pname = "ros-noetic-trac-ik-kinematics-plugin";
  version = "1.6.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "trac_ik-release";
    rev = "f41e9d1654dac800ab38b6c230b815249cd023fd";
    owner = "traclabs";
    sha256 = "sha256-/pvYkZUaWOE6NZSPe6LeDnVx9VcLYdX/jNal0osi+YU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ moveit-core nlopt pluginlib roscpp tf-conversions trac-ik-lib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A MoveIt! Kinematics plugin using TRAC-IK'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
