
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python-qt-binding, python3Packages, rosnode, rospy, rosservice, rqt-gui, rqt-gui-py }:
buildRosPackage {
  pname = "ros-noetic-rqt-logger-level";
  version = "0.4.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_logger_level-release";
    rev = "a7e04d92c643d9feded7e2a51593805a18d1bc1b";
    owner = "ros-gbp";
    sha256 = "sha256-e8Fr+N0QJcC3uUE5QO2HqL8VgqgIipSH0nkAKr9hGxU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ python-qt-binding python3Packages.rospkg rosnode rospy rosservice rqt-gui rqt-gui-py ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rqt_logger_level provides a GUI plugin for configuring the logger level of ROS nodes.<br/>
   <br/>
  rqt_logger_level takes over `wx`-based tool [[rxloggerlevel]].'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
