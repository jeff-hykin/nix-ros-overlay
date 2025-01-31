
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, code-coverage, fmt, geometry-msgs, message-generation, message-runtime, robot-state-publisher, rosbag, rosconsole-bridge, roscpp, roslaunch, rostest, rosunit, rviz, sensor-msgs, std-msgs, tinyxml-2, visualization-msgs, xacro }:
buildRosPackage {
  pname = "ros-melodic-psen-scan-v2";
  version = "0.10.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "psen_scan_v2-release";
    rev = "ced27a9a0b1d60df0dd8d195a1fabd5892fa013f";
    owner = "PilzDE";
    sha256 = "sha256-Ufw3h/3Yl7IeD+f7U132XgTHjticFhuMQskiyohjrkk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules message-generation ];
  checkInputs = [ code-coverage rosbag roslaunch rostest rosunit ];
  propagatedBuildInputs = [ fmt geometry-msgs message-runtime robot-state-publisher rosconsole-bridge roscpp roslaunch rviz sensor-msgs std-msgs tinyxml-2 visualization-msgs xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS support for the Pilz laser scanner'';
    license = with lib.licenses; [ lgpl3Only ];
  };
}
