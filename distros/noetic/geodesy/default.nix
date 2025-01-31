
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, catkin, geographic-msgs, geometry-msgs, python3Packages, rosunit, sensor-msgs, tf, unique-id, uuid-msgs }:
buildRosPackage {
  pname = "ros-noetic-geodesy";
  version = "0.5.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "geographic_info-release";
    rev = "573c94b6a577a2fe8095c31100a99a7ede4daf76";
    owner = "ros-geographic-info";
    sha256 = "sha256-3NDENuO56mgQho0Y3nLmEuL/tz7pCcW159ZAQoeDpBE=";
  };

  buildType = "catkin";
  buildInputs = [ angles catkin python3Packages.catkin-pkg python3Packages.setuptools ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ geographic-msgs geometry-msgs python3Packages.pyproj sensor-msgs tf unique-id uuid-msgs ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''Python and C++ interfaces for manipulating geodetic coordinates.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
