
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, catkin, geographic-msgs, geometry-msgs, pythonPackages, rosunit, sensor-msgs, tf, unique-id, uuid-msgs }:
buildRosPackage {
  pname = "ros-melodic-geodesy";
  version = "0.5.3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "geographic_info-release";
    rev = "51e8c3cad3369f1b647eb8876f677161eb052443";
    owner = "ros-geographic-info";
    sha256 = "sha256-hhVKkLuDjbfnjwNkoO9Yzm76mB5ZdJsCNy5cwJmSBpU=";
  };

  buildType = "catkin";
  buildInputs = [ angles catkin pythonPackages.catkin-pkg ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ geographic-msgs geometry-msgs pythonPackages.pyproj sensor-msgs tf unique-id uuid-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Python and C++ interfaces for manipulating geodetic coordinates.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
