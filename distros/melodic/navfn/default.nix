
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, costmap-2d, geometry-msgs, message-generation, message-runtime, nav-core, nav-msgs, netpbm, pluginlib, rosconsole, roscpp, rosunit, sensor-msgs, tf2-ros, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-navfn";
  version = "1.16.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation-release";
    rev = "6f45f28763bdfcac819f820027cc2e88061060bc";
    owner = "ros-gbp";
    sha256 = "sha256-oE+kRngWePrYUnqL1ILyrH2OvJVvnR6T3MSZ+7QYksI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules message-generation netpbm ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ costmap-2d geometry-msgs message-runtime nav-core nav-msgs pluginlib rosconsole roscpp sensor-msgs tf2-ros visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''navfn provides a fast interpolated navigation function that can be used to create plans for
        a mobile base. The planner assumes a circular robot and operates on a costmap to find a
        minimum cost plan from a start point to an end point in a grid. The navigation function is
        computed with Dijkstra's algorithm, but support for an A* heuristic may also be added in the
        near future. navfn also provides a ROS wrapper for the navfn planner that adheres to the
        nav_core::BaseGlobalPlanner interface specified in <a href="http://wiki.ros.org/nav_core">nav_core</a>.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
