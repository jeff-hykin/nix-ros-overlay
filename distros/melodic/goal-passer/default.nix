
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, costmap-2d, nav-core, pluginlib, roscpp }:
buildRosPackage {
  pname = "ros-melodic-goal-passer";
  version = "0.3.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_experimental-release";
    rev = "e48f151a5b84977783237379caaf1fde85133ff1";
    owner = "ros-gbp";
    sha256 = "sha256-yFz90bEkJP+uXtnIeOOL8WHzbhDtkb//GqD7y1SIFA0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ costmap-2d nav-core pluginlib roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A global planner plugin for move_base that simply passes the target pose on
    as a global plan. Useful for debugging local planners.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
