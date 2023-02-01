
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pluginlib, qt5, roscpp, rosmon-msgs, rqt-gui, rqt-gui-cpp }:
buildRosPackage {
  pname = "ros-noetic-rqt-rosmon";
  version = "2.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosmon-release";
    rev = "7c3f5c84ed50b155f55a9a8dc7134846c0e4b726";
    owner = "xqms";
    sha256 = "sha256-MtQbMc9qsOOZSyNO8sDq3Xl6yHnt/EiV+5wwP6L8Dvs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin qt5.qtbase ];
  propagatedBuildInputs = [ pluginlib roscpp rosmon-msgs rqt-gui rqt-gui-cpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rqt GUI for rosmon, the node launcher and monitor for ROS.
		rosmon is a replacement for the roslaunch tool, focused on performance,
		remote monitoring, and usability.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
