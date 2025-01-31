
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, costmap-2d, message-generation, message-runtime, roscpp, sensor-msgs, tf, tf2-ros }:
buildRosPackage {
  pname = "ros-noetic-nav2d-operator";
  version = "0.4.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_2d-release";
    rev = "65b103e5926507c4e322e709f2449431ddd110da";
    owner = "skasperski";
    sha256 = "sha256-hI9HTZOuyv9zCROajjUTfm+nfmXJaK3Rba4JB5/Lha8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation tf2-ros ];
  propagatedBuildInputs = [ costmap-2d message-runtime roscpp sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The operator is a lightweight, purely reactive obstacle-avoidance
    module for mobile robots moving in a planar environment. The operator node
    works by evaluating a set of predefined motion primitives based on a local
    costmap and a desired direction. The best evaluated motion command will be
    send to the mobile base.'';
    license = with lib.licenses; [ gpl3Only ];
  };
}
