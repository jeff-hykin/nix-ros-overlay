
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, geodesy, geographic-msgs, glog, nmea-msgs, quaternion-operation, roscpp }:
buildRosPackage {
  pname = "ros-melodic-nmea-to-geopose";
  version = "0.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "nmea_to_geopose-release";
    rev = "9678df97605a1b098e01b1473aa77b0f2afddc36";
    owner = "OUXT-Polaris";
    sha256 = "sha256-v/ep1pCjJB7BmSmhQQNz60AiNkOQ+y4dvJzQKC0J8YY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eigen geodesy geographic-msgs glog nmea-msgs quaternion-operation roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The nmea_to_geopose package'';
    license = with lib.licenses; [ asl20 ];
  };
}
