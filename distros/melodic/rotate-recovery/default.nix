
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, base-local-planner, catkin, cmake-modules, costmap-2d, eigen, geometry-msgs, nav-core, pluginlib, roscpp, tf2, tf2-geometry-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-melodic-rotate-recovery";
  version = "1.16.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation-release";
    rev = "59934dd6b0f850131e5fe90af1e12b4627509de6";
    owner = "ros-gbp";
    sha256 = "sha256-wWsK87QZPbZTjsdp9dO9dS524F6aMAALzkyt+sBdUfw=";
  };

  buildType = "catkin";
  buildInputs = [ angles base-local-planner catkin cmake-modules ];
  propagatedBuildInputs = [ costmap-2d eigen geometry-msgs nav-core pluginlib roscpp tf2 tf2-geometry-msgs tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides a recovery behavior for the navigation stack that attempts to clear space by performing a 360 degree rotation of the robot.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
