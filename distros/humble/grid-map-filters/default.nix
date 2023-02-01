
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-lint-auto, ament-lint-common, filters, grid-map-cmake-helpers, grid-map-core, grid-map-msgs, grid-map-ros, pluginlib, tbb }:
buildRosPackage {
  pname = "ros-humble-grid-map-filters";
  version = "2.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grid_map-release";
    rev = "6d182651e54752bd7328e659b65d77a410b084f8";
    owner = "ros2-gbp";
    sha256 = "sha256-mbBzPfgfLKp1Bm8HXCZ012tMsPZzm05OBQ25VgDch0g=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake grid-map-cmake-helpers ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ filters grid-map-core grid-map-msgs grid-map-ros pluginlib tbb ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Processing grid maps as a sequence of ROS filters.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
