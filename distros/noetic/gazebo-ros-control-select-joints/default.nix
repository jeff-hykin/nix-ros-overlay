
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, catkin, control-toolbox, controller-manager, gazebo, gazebo-ros, gazebo-ros-control, hardware-interface, joint-limits-interface, pluginlib, roscpp, std-msgs, transmission-interface, urdf }:
buildRosPackage {
  pname = "ros-noetic-gazebo-ros-control-select-joints";
  version = "2.5.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "gazebo_ros_control_select_joints-release";
    rev = "dbaf2662440b709f0257e1f128726ff15d694c92";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-xthWwWVwN+s8gxV1J1wk6eQVQ2OQZ+dZNoWLarqgm5M=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ angles control-toolbox controller-manager gazebo gazebo-ros gazebo-ros-control hardware-interface joint-limits-interface pluginlib roscpp std-msgs transmission-interface urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''gazebo_ros_contrl_select_joints'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
