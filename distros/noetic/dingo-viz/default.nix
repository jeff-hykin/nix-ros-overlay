
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dingo-description, joint-state-publisher-gui, roslaunch, rqt-console, rqt-gui, rqt-robot-monitor, rviz }:
buildRosPackage {
  pname = "ros-noetic-dingo-viz";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dingo_desktop-release";
    rev = "641f0f9cc628fcf68922a038cfda64bfb3fd912c";
    owner = "clearpath-gbp";
    sha256 = "sha256-IGPvo5OSnIyMik+askiIoowplG4Soh5t1TwuaNrJfcc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch ];
  propagatedBuildInputs = [ dingo-description joint-state-publisher-gui rqt-console rqt-gui rqt-robot-monitor rviz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Visualization launchers and helpers for Dingo.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
