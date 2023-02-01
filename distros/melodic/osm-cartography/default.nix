
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, geodesy, geographic-msgs, geometry-msgs, roslaunch, rospy, route-network, std-msgs, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-osm-cartography";
  version = "0.2.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "open_street_map-release";
    rev = "a5c218d1f1b7e0c8a730e197cc60e8e1f4db9cfd";
    owner = "ros-geographic-info";
    sha256 = "sha256-MgBT9qkbh9onGKyhXplksd0MMAeeW/LoHiAtdS5IUEg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch ];
  propagatedBuildInputs = [ dynamic-reconfigure geodesy geographic-msgs geometry-msgs rospy route-network std-msgs tf visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Geographic mapping using Open Street Map data.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
