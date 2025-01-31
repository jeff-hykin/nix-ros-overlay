
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, backward-ros, catkin, distance-map-core, interactive-markers, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-distance-map-tools";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "distance_map-release";
    rev = "5b128c42f96bb1c9e7b790a247cdfe2069c3a41b";
    owner = "artivis";
    sha256 = "sha256-TXf+kMoJXsrddThrtTLT3r27lJXS6Eqai0i7puZtVy8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ backward-ros distance-map-core interactive-markers visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Node package of the map_distance project.
    It contains the ROS node that instantiate the
    distance map plugin.'';
    license = with lib.licenses; [ asl20 ];
  };
}
