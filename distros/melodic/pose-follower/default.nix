
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, base-local-planner, catkin, costmap-2d, dynamic-reconfigure, nav-core, nav-msgs, pluginlib, roscpp, tf2-geometry-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-melodic-pose-follower";
  version = "0.3.6-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "ros-gbp";
        repo = "navigation_experimental-release";
        rev = "release/melodic/pose_follower/0.3.6-1";
        sha256 = "sha256-bC9soEQchLTLRT4/9sg3mJa+Ou0iCcEjr9/JP68GqNU=";
      };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ base-local-planner costmap-2d dynamic-reconfigure nav-core nav-msgs pluginlib roscpp tf2-geometry-msgs tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A implementation of a local planner that attempts to follow a plan as closely as possible.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
