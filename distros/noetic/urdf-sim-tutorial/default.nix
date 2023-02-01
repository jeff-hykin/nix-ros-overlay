
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-manager, diff-drive-controller, gazebo-ros, gazebo-ros-control, joint-state-controller, position-controllers, robot-state-publisher, rqt-robot-steering, rviz, urdf-tutorial, xacro }:
buildRosPackage {
  pname = "ros-noetic-urdf-sim-tutorial";
  version = "0.5.1-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "ros-gbp";
        repo = "urdf_sim_tutorial-release";
        rev = "release/noetic/urdf_sim_tutorial/0.5.1-1";
        sha256 = "sha256-nAkWplAk41sX0ydSGvp7wjX513FH/EHSvrIFnReRIkY=";
      };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ controller-manager diff-drive-controller gazebo-ros gazebo-ros-control joint-state-controller position-controllers robot-state-publisher rqt-robot-steering rviz urdf-tutorial xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The urdf_sim_tutorial package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
