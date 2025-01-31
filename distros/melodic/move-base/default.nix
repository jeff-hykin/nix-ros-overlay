
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, base-local-planner, catkin, clear-costmap-recovery, cmake-modules, costmap-2d, dynamic-reconfigure, geometry-msgs, message-generation, message-runtime, move-base-msgs, nav-core, nav-msgs, navfn, pluginlib, roscpp, rospy, rotate-recovery, std-srvs, tf2-geometry-msgs, tf2-ros, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-move-base";
  version = "1.16.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation-release";
    rev = "36aaf61abc6683b5fa6598acd64f5b330fc86ecb";
    owner = "ros-gbp";
    sha256 = "sha256-r0760iejdGU+HcWfTY7GEoOvloucsrU/IjQ/Z0Jyc/g=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules message-generation tf2-geometry-msgs ];
  propagatedBuildInputs = [ actionlib base-local-planner clear-costmap-recovery costmap-2d dynamic-reconfigure geometry-msgs message-runtime move-base-msgs nav-core nav-msgs navfn pluginlib roscpp rospy rotate-recovery std-srvs tf2-ros visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The move_base package provides an implementation of an action (see the <a href="http://www.ros.org/wiki/actionlib">actionlib</a> package) that, given a goal in the world, will attempt to reach it with a mobile base. The move_base node links together a global and local planner to accomplish its global navigation task. It supports any global planner adhering to the nav_core::BaseGlobalPlanner interface specified in the <a href="http://www.ros.org/wiki/nav_core">nav_core</a> package and any local planner adhering to the nav_core::BaseLocalPlanner interface specified in the <a href="http://www.ros.org/wiki/nav_core">nav_core</a> package. The move_base node also maintains two costmaps, one for the global planner, and one for a local planner (see the <a href="http://www.ros.org/wiki/costmap_2d">costmap_2d</a> package) that are used to accomplish navigation tasks.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
