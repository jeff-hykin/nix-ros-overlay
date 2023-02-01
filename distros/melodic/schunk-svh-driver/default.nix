
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, combined-robot-hw, controller-manager, dynamic-reconfigure, hardware-interface, joint-limits-interface, joint-state-controller, joint-state-publisher, joint-trajectory-controller, pluginlib, python-qt-binding, pythonPackages, qt-gui, robot-state-publisher, roscpp, rospy, rqt-gui, rqt-gui-py, schunk-svh-description, schunk-svh-library, schunk-svh-msgs, sensor-msgs, std-msgs, urdf, xacro }:
buildRosPackage {
  pname = "ros-melodic-schunk-svh-driver";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "schunk_svh_ros_driver-release";
    rev = "f522933e9cf7c9e339de9862f0641d5f541d52a3";
    owner = "fzi-forschungszentrum-informatik";
    sha256 = "sha256-HBTuzXhK4KHvVXnUJxs6c6SLCIVCmnTndXL+XNErmCo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib combined-robot-hw controller-manager dynamic-reconfigure hardware-interface joint-limits-interface joint-state-controller joint-state-publisher joint-trajectory-controller pluginlib python-qt-binding pythonPackages.rospkg qt-gui robot-state-publisher roscpp rospy rqt-gui rqt-gui-py schunk-svh-description schunk-svh-library schunk-svh-msgs sensor-msgs std-msgs urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS1 driver for the Schunk SVH five finger hand'';
    license = with lib.licenses; [ "GPL-3.0-or-later" ];
  };
}
