
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python-qt-binding, pythonPackages, qt-gui, rospy, rqt-gui, rqt-gui-py, webkit-dependency }:
buildRosPackage {
  pname = "ros-melodic-rqt-web";
  version = "0.4.8";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_web-release";
    rev = "4e01cfb94aad673f8b3f02cda523cba2ee6c09d2";
    owner = "ros-gbp";
    sha256 = "sha256-Cg0Qwsb2JfzJiTpt2hijreVJpldKr4hKp3eG3ec6ay8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ python-qt-binding pythonPackages.rospkg qt-gui rospy rqt-gui rqt-gui-py webkit-dependency ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rqt_web is a simple web content viewer for rqt. Users can show web content in Qt-based window by specifying its URL.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
