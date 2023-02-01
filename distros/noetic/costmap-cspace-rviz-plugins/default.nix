
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, costmap-cspace-msgs, qt5, roscpp, roslint, rviz }:
buildRosPackage {
  pname = "ros-noetic-costmap-cspace-rviz-plugins";
  version = "0.11.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "neonavigation_rviz_plugins-release";
    rev = "2856f26fab8a4a01beece6062395e16746db6f29";
    owner = "at-wat";
    sha256 = "sha256-AZXjHbkeKfD4qwfQ4109dCTQVvKOpA6QfPkrNsvaiOc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint ];
  propagatedBuildInputs = [ costmap-cspace-msgs qt5.qtbase roscpp rviz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Rviz plugins for costmap_cspace_msgs'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
