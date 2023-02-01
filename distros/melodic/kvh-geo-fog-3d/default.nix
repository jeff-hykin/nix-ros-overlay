
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, kvh-geo-fog-3d-driver, kvh-geo-fog-3d-msgs, kvh-geo-fog-3d-rviz }:
buildRosPackage {
  pname = "ros-melodic-kvh-geo-fog-3d";
  version = "1.5.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "kvh_geo_fog_3d-release";
    rev = "a3116bc2cf616a03d297e776a8ef5db68683166d";
    owner = "MITRE";
    sha256 = "sha256-3jNCCKMdZNlkLZS8gWJzd1KBfOEqCUC3VLZ3P29fVMI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ kvh-geo-fog-3d-driver kvh-geo-fog-3d-msgs kvh-geo-fog-3d-rviz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Provides a driver node for KVH GEO FOG 3D INS sensors, messages, and rviz plugins.'';
    license = with lib.licenses; [ asl20 ];
  };
}
