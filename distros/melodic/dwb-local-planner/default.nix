
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dwb-msgs, geometry-msgs, nav-2d-msgs, nav-2d-utils, nav-core2, nav-msgs, pluginlib, roscpp, roslint, rostest, rosunit, sensor-msgs, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-dwb-local-planner";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_navigation-release";
    rev = "5746c1d7b6863af95b525e937f9864143aa7cd50";
    owner = "DLu";
    sha256 = "sha256-YCDNfEipWTd+F6LZgOzfAaYti0HSZN0iB9+ys2VMJeg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint rostest rosunit ];
  propagatedBuildInputs = [ dwb-msgs geometry-msgs nav-2d-msgs nav-2d-utils nav-core2 nav-msgs pluginlib roscpp sensor-msgs tf visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Plugin based local planner implementing the nav_core2::LocalPlanner interface.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
