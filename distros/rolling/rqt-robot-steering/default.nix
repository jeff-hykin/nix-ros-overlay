
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-index-python, geometry-msgs, python-qt-binding, rclpy, rqt-gui, rqt-gui-py }:
buildRosPackage {
  pname = "ros-rolling-rqt-robot-steering";
  version = "1.0.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_robot_steering-release";
    rev = "fd12294c1c5816a518e085db10d591f79e6c72e4";
    owner = "ros2-gbp";
    sha256 = "sha256-GQCdfFYxE/yR3Eostcf+T9VKwP2N45EzidAhXz5uVrw=";
  };

  buildType = "ament_python";
  propagatedBuildInputs = [ ament-index-python geometry-msgs python-qt-binding rclpy rqt-gui rqt-gui-py ];

  meta = {
    description = ''rqt_robot_steering provides a GUI plugin for steering a robot using Twist messages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
