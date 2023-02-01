
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-updater, dynamic-reconfigure, geometry-msgs, kvh-geo-fog-3d-msgs, message-generation, message-runtime, nav-msgs, roscpp, roslint, rosunit, sensor-msgs, std-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-noetic-kvh-geo-fog-3d-driver";
  version = "1.5.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "kvh_geo_fog_3d-release";
    rev = "5d18a0ff7b82664f15d19fac0bdfa3ae405c79ad";
    owner = "MITRE";
    sha256 = "sha256-NzHPOtfKvXWFJK+MMYhpqaJb6qCx+61cdVpz66j12mw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslint ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ diagnostic-updater dynamic-reconfigure geometry-msgs kvh-geo-fog-3d-msgs message-generation message-runtime nav-msgs roscpp sensor-msgs std-msgs tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A ROS driver for the KVH Geo Fog 3D INS family of systems.'';
    license = with lib.licenses; [ asl20 ];
  };
}
