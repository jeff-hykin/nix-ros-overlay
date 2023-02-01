
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geodesy, geographic-msgs, osm-cartography, route-network }:
buildRosPackage {
  pname = "ros-noetic-test-osm";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "open_street_map-release";
    rev = "0a2fae143e9c69484c93edb17f9fa0b281cabf5d";
    owner = "ros-geographic-info";
    sha256 = "sha256-OghAwD6XP37Rgcw4xovzBFONLsBLg8jyV/hfJ/MDnQk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geodesy geographic-msgs osm-cartography route-network ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''These are regression tests for the osm_cartography and
     route_network packages. They are packaged separately to avoid
     unnecessary implementation dependencies.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
