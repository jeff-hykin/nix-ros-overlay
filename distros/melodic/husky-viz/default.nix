
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, husky-description, joint-state-publisher, joint-state-publisher-gui, robot-state-publisher, roslaunch, rqt-console, rqt-gui, rqt-robot-monitor, rviz, rviz-imu-plugin }:
buildRosPackage {
  pname = "ros-melodic-husky-viz";
  version = "0.4.13-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "husky-release";
    rev = "16399bc150a54d983f5e121dd4355d0e557f57ce";
    owner = "clearpath-gbp";
    sha256 = "sha256-nb2BOzWg9mIV1knLFrgUZT6AfNy3xdmT+sosrYB8WNk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslaunch ];
  propagatedBuildInputs = [ husky-description joint-state-publisher joint-state-publisher-gui robot-state-publisher rqt-console rqt-gui rqt-robot-monitor rviz rviz-imu-plugin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Visualization configuration for Clearpath Husky'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
