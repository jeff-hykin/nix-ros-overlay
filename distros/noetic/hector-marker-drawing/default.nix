
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, roscpp, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-hector-marker-drawing";
  version = "0.5.2-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_slam-release";
    rev = "36ddb41b8caff0f07244cbdca98aa4118104f5de";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-358M5wUeJRjtRHaustqueuFFSFjmPHBQYIlOteoaq+Q=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eigen roscpp visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''hector_marker_drawing provides convenience functions for easier publishing of visualization markers.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
