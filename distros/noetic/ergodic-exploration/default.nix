
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, armadillo, catkin, geometry-msgs, map-server, nav-msgs, roscpp, rosunit, rviz, sensor-msgs, tf2, tf2-ros, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-ergodic-exploration";
  version = "1.0.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ergodic_exploration-release";
    rev = "c2d7ffecd6c074ea3b15c043950673a7ea3e4023";
    owner = "bostoncleek";
    sha256 = "sha256-/cUrh8AcZZZum43UDTN7yp6ULAY271aSygjagGJGITo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin geometry-msgs nav-msgs sensor-msgs tf2 visualization-msgs ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ armadillo map-server roscpp rviz tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Robot agnostic information theoretic exploration strategy'';
    license = with lib.licenses; [ bsd3 ];
  };
}
