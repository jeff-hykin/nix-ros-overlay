
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, catkin, color-util, geometry-msgs, nav-2d-msgs, nav-2d-utils, nav-grid, nav-grid-iterators, nav-grid-pub-sub, pluginlib, robot-nav-rviz-plugins, rosbag, roscpp, roslaunch, roslint, rviz }:
buildRosPackage {
  pname = "ros-melodic-robot-nav-viz-demos";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_navigation-release";
    rev = "75a8276e885dc7218fcc31c9971b4f727f627a57";
    owner = "DLu";
    sha256 = "sha256-F7DVlBad50iXh+OfyhHtyEqWmMF1QwgupXkUKElYMO0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch roslint ];
  propagatedBuildInputs = [ angles color-util geometry-msgs nav-2d-msgs nav-2d-utils nav-grid nav-grid-iterators nav-grid-pub-sub pluginlib robot-nav-rviz-plugins rosbag roscpp rviz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Demos for testing/demonstrating the robot_nav_rviz_plugins and color_util packages'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
