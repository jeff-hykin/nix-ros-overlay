
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, octomap-msgs, rviz, qt5, octomap, roscpp }:
buildRosPackage {
  pname = "ros-melodic-octomap-rviz-plugins";
  version = "0.2.2-r1";

  src = fetchurl {
    url = https://github.com/ros-gbp/octomap_rviz_plugins-release/archive/release/melodic/octomap_rviz_plugins/0.2.2-1.tar.gz;
    sha256 = "d1b11e67430f976ea17a6899ec116266d7b62f8e62fa579b67eb8393b72d1695";
  };

  buildInputs = [ qt5.qtbase octomap-msgs rviz octomap roscpp ];
  propagatedBuildInputs = [ qt5.qtbase octomap-msgs rviz octomap roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A set of plugins for displaying occupancy information decoded from binary octomap messages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
