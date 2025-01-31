
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, hector-compressed-map-transport, hector-geotiff, hector-geotiff-launch, hector-geotiff-plugins, hector-imu-attitude-to-tf, hector-map-server, hector-map-tools, hector-mapping, hector-marker-drawing, hector-nav-msgs, hector-slam-launch, hector-trajectory-server }:
buildRosPackage {
  pname = "ros-noetic-hector-slam";
  version = "0.5.2-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_slam-release";
    rev = "ce8289c61167b15888767fd871dab9f97906c624";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-2swqvyx4/AmmzdAbLPfLXHtmBTvSfpMddjerK+y+1NE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ hector-compressed-map-transport hector-geotiff hector-geotiff-launch hector-geotiff-plugins hector-imu-attitude-to-tf hector-map-server hector-map-tools hector-mapping hector-marker-drawing hector-nav-msgs hector-slam-launch hector-trajectory-server ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The hector_slam metapackage that installs hector_mapping and related packages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
