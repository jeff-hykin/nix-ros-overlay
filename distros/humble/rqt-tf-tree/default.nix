
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, python-qt-binding, python3Packages, qt-dotgraph, rclpy, rqt-graph, rqt-gui, rqt-gui-py, tf2-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-humble-rqt-tf-tree";
  version = "1.0.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_tf_tree-release";
    rev = "38e8689bf335f9953f211c718bc4aaf412a2b582";
    owner = "ros2-gbp";
    sha256 = "sha256-lSihCkueyTt2JXyG3jG9jZwxU5/m1zSimSfNldkQjiM=";
  };

  buildType = "ament_python";
  checkInputs = [ python3Packages.mock ];
  propagatedBuildInputs = [ python-qt-binding qt-dotgraph rclpy rqt-graph rqt-gui rqt-gui-py tf2-msgs tf2-ros ];

  meta = {
    description = ''rqt_tf_tree provides a GUI plugin for visualizing the ROS TF frame tree.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
