
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, base-local-planner, catkin, costmap-2d, nav-core, pluginlib, pose-follower, roscpp, sbpl-lattice-planner, tf2-ros }:
buildRosPackage {
  pname = "ros-noetic-sbpl-recovery";
  version = "0.4.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_experimental-release";
    rev = "54c3bbeb37775b9fc53669713a79abbf57c85946";
    owner = "ros-gbp";
    sha256 = "sha256-Ac8w2QX3CHY+2sqXFhnQRcmCYAVgKJIc62mllFFwdno=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ base-local-planner costmap-2d nav-core pluginlib pose-follower roscpp sbpl-lattice-planner tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A recovery behavior that uses the sbpl lattice planner and the pose
    follower to try to plan in full 3D to get the robot out of really tricky
    situations.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
