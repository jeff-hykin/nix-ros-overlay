
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, costmap-2d, geometry-msgs, map-msgs, move-base-msgs, nav-msgs, roscpp, roslaunch, std-msgs, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-explore-lite";
  version = "2.1.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "m-explore-release";
    rev = "df43409c857682c89930e24099797997a533654d";
    owner = "hrnr";
    sha256 = "sha256-G6WSRw39XxIsShtpEh9Bvu52YIuixuqNW4MFvpc+xAY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch ];
  propagatedBuildInputs = [ actionlib actionlib-msgs costmap-2d geometry-msgs map-msgs move-base-msgs nav-msgs roscpp std-msgs tf visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Lightweight frontier-based exploration.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
