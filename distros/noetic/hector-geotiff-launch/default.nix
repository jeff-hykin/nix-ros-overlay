
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, hector-geotiff, hector-geotiff-plugins, hector-trajectory-server }:
buildRosPackage {
  pname = "ros-noetic-hector-geotiff-launch";
  version = "0.5.2-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_slam-release";
    rev = "9ae837fa5ba7a6a29dc1d90d5c7ccefe4f6b760a";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-VssSobVIbY4BnIYyq5RU+MsLy8dBMOuR+KYhItdsBEw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ hector-geotiff hector-geotiff-plugins hector-trajectory-server ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Contains launch files for the hector_geotiff mapper.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
