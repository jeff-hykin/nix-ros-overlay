
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, qt5, roscpp }:
buildRosPackage {
  pname = "ros-melodic-qt-paramedit";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_paramedit-release";
    rev = "4c761ae68044f6fe857e9aed2a31e00f9d3e7b9c";
    owner = "dornhege";
    sha256 = "sha256-UuDP8EDx1pLkX0S+NWf3nL3v5JVF9Lx6j6VYQAtMoKI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ qt5.qtbase roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A GUI application for viewing and editing ROS parameters.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
