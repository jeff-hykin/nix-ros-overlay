
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-kvh-geo-fog-3d-msgs";
  version = "1.5.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "kvh_geo_fog_3d-release";
    rev = "c9f902778271ad29f2a6addd49a390b6eda2019f";
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
