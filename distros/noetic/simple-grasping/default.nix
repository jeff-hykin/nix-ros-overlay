
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, cmake-modules, geometry-msgs, grasping-msgs, message-generation, message-runtime, moveit-msgs, moveit-python, pcl-ros, roscpp, sensor-msgs, shape-msgs, tf, vtkWithQt5 }:
buildRosPackage {
  pname = "ros-noetic-simple-grasping";
  version = "0.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "simple_grasping-release";
    rev = "73aff7554abc9709ff00282359271807896152dc";
    owner = "ros-gbp";
    sha256 = "sha256-EGllvPx8vCsQJEPfg73wA1grw7WDAOkILY2T3nf1F6w=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules message-generation ];
  propagatedBuildInputs = [ actionlib geometry-msgs grasping-msgs message-runtime moveit-msgs moveit-python pcl-ros roscpp sensor-msgs shape-msgs tf vtkWithQt5 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Basic grasping applications and demos.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
