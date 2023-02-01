
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diff-drive-controller, gazebo-plugins, gazebo-ros-control, hector-gazebo-plugins, joint-state-controller, joint-state-publisher, joint-state-publisher-gui, position-controllers, robot-state-publisher, roslaunch, rviz, urdf, xacro }:
buildRosPackage {
  pname = "ros-noetic-mir-description";
  version = "1.1.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mir_robot-release";
    rev = "4fcf28db1d644bf911171ee6f56218e232092092";
    owner = "uos-gbp";
    sha256 = "sha256-2hjKBIwpVYdT2VfBYHOOlrxTOgdc+WIYxVBI/4o4aZs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslaunch ];
  propagatedBuildInputs = [ diff-drive-controller gazebo-plugins gazebo-ros-control hector-gazebo-plugins joint-state-controller joint-state-publisher joint-state-publisher-gui position-controllers robot-state-publisher rviz urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''URDF description of the MiR robot'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
