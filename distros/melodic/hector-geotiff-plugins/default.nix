
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, hector-geotiff, hector-nav-msgs }:
buildRosPackage {
  pname = "ros-melodic-hector-geotiff-plugins";
  version = "0.4.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_slam-release";
    rev = "82387a08a5b9fe35f68e24b13d299f1802878078";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-FDed7b21RS9hgQ+vVy6TRH/k+Yx0rWP/V++KdBcvYCA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ hector-geotiff hector-nav-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''hector_geotiff_plugins contains plugins that extend geotiff maps generated by hector_geotiff.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
