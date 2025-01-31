
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, fuse-constraints, fuse-core, fuse-graphs, fuse-variables, geometry-msgs, nav-msgs, pluginlib, roscpp, roslint, rostest, tf2, tf2-geometry-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-melodic-fuse-publishers";
  version = "0.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fuse-release";
    rev = "04fbff5f0ac2251fef30a1f3e86af055525e48ac";
    owner = "locusrobotics";
    sha256 = "sha256-VXMzYTYgXUqhkAVxkw5tmV8Zvfp38oZxyLfEAmmFj+Q=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ fuse-constraints fuse-graphs roslint rostest ];
  propagatedBuildInputs = [ fuse-core fuse-variables geometry-msgs nav-msgs pluginlib roscpp tf2 tf2-geometry-msgs tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The fuse_publishers package provides a set of common publisher plugins.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
