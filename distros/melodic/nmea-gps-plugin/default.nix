
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, gazebo, gazebo-ros, geodesy, geographic-msgs, nmea-msgs, quaternion-operation, roscpp, rosdoc-lite }:
buildRosPackage {
  pname = "ros-melodic-nmea-gps-plugin";
  version = "0.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "nmea_gps_plugin-release";
    rev = "55a72aee58f1b4e26066970e4b882334e830a647";
    owner = "OUXT-Polaris";
    sha256 = "sha256-3cQxjbSmyUeikEphG+FvO/8v3p0Bzj5hrW555uv1avU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eigen gazebo gazebo-ros geodesy geographic-msgs nmea-msgs quaternion-operation roscpp rosdoc-lite ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The nmea_gps_plugin package'';
    license = with lib.licenses; [ asl20 ];
  };
}
