
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-kvh-geo-fog-3d-msgs";
  version = "1.5.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "kvh_geo_fog_3d-release";
    rev = "236e485a4a4ee055069bf7bdab2f07ab22b9f325";
    owner = "MITRE";
    sha256 = "sha256-3Iif23aBXpZVarMlripUtWjO6saS/vSwInZruF6HDps=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin message-generation ];

  meta = {
    description = ''kvh_geo_fog_3d_msgs contains raw messages for the KVH GEO FOG 3D INS devices.'';
    license = with lib.licenses; [ asl20 ];
  };
}
