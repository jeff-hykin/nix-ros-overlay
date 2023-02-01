
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-msgs, python-qt-binding, qt-gui, rospy, rqt-console, rqt-gui, rqt-gui-py, rqt-nav-view, rqt-robot-monitor }:
buildRosPackage {
  pname = "ros-melodic-rqt-robot-dashboard";
  version = "0.5.7";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_robot_dashboard-release";
    rev = "6e6c3bc27e32b79fbe29abbdf835ec9b5328d238";
    owner = "ros-gbp";
    sha256 = "sha256-K7snpxSWSzpE7y/UdF80x0dctTTyuhJY/MyNMeBTmEQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ diagnostic-msgs python-qt-binding qt-gui rospy rqt-console rqt-gui rqt-gui-py rqt-nav-view rqt-robot-monitor ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rqt_robot_dashboard provides an infrastructure for building robot dashboard plugins in rqt.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
