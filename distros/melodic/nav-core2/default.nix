
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nav-2d-msgs, nav-grid, roslint, rosunit, tf2-ros }:
buildRosPackage {
  pname = "ros-melodic-nav-core2";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_navigation-release";
    rev = "e4a3e9bfbcf319b9435396267cbb0d5e57b42c38";
    owner = "DLu";
    sha256 = "sha256-HtN1Qepc1Z/BArsAUomEproTHbeCZj5ijrc1/AVpv2E=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint rosunit ];
  propagatedBuildInputs = [ nav-2d-msgs nav-grid tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Interfaces for Costmap, LocalPlanner and GlobalPlanner. Replaces nav_core.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
