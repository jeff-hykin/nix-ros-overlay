
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, base-local-planner, catkin, cmake-modules, costmap-2d, costmap-converter, dynamic-reconfigure, geometry-msgs, interactive-markers, libg2o, mbf-costmap-core, mbf-msgs, message-generation, message-runtime, nav-core, nav-msgs, pluginlib, roscpp, std-msgs, tf2, tf2-eigen, tf2-geometry-msgs, tf2-ros, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-teb-local-planner";
  version = "0.9.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "teb_local_planner-release";
    rev = "14705fe0c2709f8db83f2cfdd405f9f956ea0133";
    owner = "rst-tu-dortmund";
    sha256 = "sha256-BVX39bC/UcEh0JzuSYVRLGLiAThrxtb+btawCdgQwjU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules message-generation tf2-eigen tf2-geometry-msgs ];
  propagatedBuildInputs = [ base-local-planner costmap-2d costmap-converter dynamic-reconfigure geometry-msgs interactive-markers libg2o mbf-costmap-core mbf-msgs message-runtime nav-core nav-msgs pluginlib roscpp std-msgs tf2 tf2-ros visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The teb_local_planner package implements a plugin
    to the base_local_planner of the 2D navigation stack.
    The underlying method called Timed Elastic Band locally optimizes
    the robot's trajectory with respect to trajectory execution time,
    separation from obstacles and compliance with kinodynamic constraints at runtime.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
