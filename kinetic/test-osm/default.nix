
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geodesy, geographic-msgs, osm-cartography, route-network }:
buildRosPackage {
  pname = "ros-kinetic-test-osm";
  version = "0.2.4";

  src = fetchurl {
    url = "https://github.com/ros-geographic-info/open_street_map-release/archive/release/kinetic/test_osm/0.2.4-0.tar.gz";
    name = "0.2.4-0.tar.gz";
    sha256 = "7fd6af55b0a2548b5d501882bcac1429f7ad9039be66bc07a5049b6229cdeb17";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ geodesy geographic-msgs osm-cartography route-network ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''These are regression tests for the osm_cartography and
     route_network packages. They are packaged separately to avoid
     unnecessary implementation dependencies.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
