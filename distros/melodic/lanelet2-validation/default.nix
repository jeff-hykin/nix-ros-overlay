
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gtest, lanelet2-core, lanelet2-io, lanelet2-maps, lanelet2-projection, lanelet2-routing, lanelet2-traffic-rules, mrt-cmake-modules }:
buildRosPackage {
  pname = "ros-melodic-lanelet2-validation";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "lanelet2-release";
    rev = "c247320d295d063b44a31dfea49aabbf530b713e";
    owner = "fzi-forschungszentrum-informatik";
    sha256 = "sha256-AXJOe+HvlrLK6hqpNMlME85xr4N/j5nYcAwWashVn3s=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest lanelet2-maps ];
  propagatedBuildInputs = [ lanelet2-core lanelet2-io lanelet2-projection lanelet2-routing lanelet2-traffic-rules mrt-cmake-modules ];
  nativeBuildInputs = [ catkin mrt-cmake-modules ];

  meta = {
    description = ''Package for sanitizing lanelet maps'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
