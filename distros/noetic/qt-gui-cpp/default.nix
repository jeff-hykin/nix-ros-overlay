
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, pkg-config, pluginlib, python-qt-binding, python3Packages, qt-gui, qt5, tinyxml }:
buildRosPackage {
  pname = "ros-noetic-qt-gui-cpp";
  version = "0.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "qt_gui_core-release";
    rev = "c7a43903302ca222476fede775ea2c2cc86ef552";
    owner = "ros-gbp";
    sha256 = "sha256-ubGKO0iQMzc67IEIOiIccxCAHTdk70EId1spz9ILyMQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules pkg-config python-qt-binding python3Packages.setuptools qt5.qtbase ];
  propagatedBuildInputs = [ pluginlib qt-gui tinyxml ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available.
    At least one specific binding must be available in order to use C++-plugins.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
