
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-index-python, python-qt-binding, qt-gui, qt-gui-py-common, rclpy, rqt-gui, rqt-gui-py }:
buildRosPackage {
  pname = "ros-foxy-rqt-py-console";
  version = "1.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_py_console-release";
    rev = "11f5e1785acb2f3219989fc89436f43b063e04c4";
    owner = "ros2-gbp";
    sha256 = "sha256-yLjOc2LoQeh7Yx+T6GKB+Xbdm3NG47pMTU2gIzn+uZY=";
  };

  buildType = "ament_python";
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-gui qt-gui-py-common rclpy rqt-gui rqt-gui-py ];

  meta = {
    description = ''rqt_py_console is a Python GUI plugin providing an interactive Python console.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
