
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, qt-paramedit, qt5, roscpp, rqt-gui, rqt-gui-cpp }:
buildRosPackage {
  pname = "ros-melodic-rqt-paramedit";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_paramedit-release";
    rev = "b453b2a142aaf0a2d953c8828e3961c080ebadb8";
    owner = "dornhege";
    sha256 = "sha256-7ylX8byVohqvSZ1fGgMWWkhYCv+sBKjiKasx85Ku1Jo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ qt-paramedit qt5.qtbase roscpp rqt-gui rqt-gui-cpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rqt_paramedit - a rqt plugin for editing parameters using qt_paramedit.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
