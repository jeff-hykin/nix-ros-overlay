
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python-qt-binding, roslaunch, rospy, rqt-console, rqt-gui, rqt-gui-py, rqt-py-common }:
buildRosPackage {
  pname = "ros-noetic-rqt-launch";
  version = "0.4.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_launch-release";
    rev = "ae98f18d94a86ac8b1bb78ba87b22aac92d33adc";
    owner = "ros-gbp";
    sha256 = "sha256-bI2WbkDwnD7Po2XjILoHUCnHjcqZD/B73BsPyLBta8A=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ python-qt-binding roslaunch rospy rqt-console rqt-gui rqt-gui-py rqt-py-common ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This rqt plugin ROS package provides easy view of .launch files.
  User can also start and end node by node that are defined in those files.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
