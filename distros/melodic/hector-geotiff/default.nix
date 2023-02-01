
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, hector-map-tools, hector-nav-msgs, nav-msgs, pluginlib, qt4, roscpp, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-hector-geotiff";
  version = "0.4.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_slam-release";
    rev = "aa34ecaa4b5b24a4cc3fb8ad2750951076d2d71e";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-FgcopOkapFpBCIEMmIoYSltUEaLqG3FuLzkgTMz6nYw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ hector-map-tools hector-nav-msgs nav-msgs pluginlib qt4 roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''hector_geotiff provides a node that can be used to save occupancy grid map, robot trajectory and object of interest data to RoboCup Rescue compliant GeoTiff images.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
