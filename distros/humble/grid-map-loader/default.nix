
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-lint-auto, ament-lint-common, grid-map-cmake-helpers, grid-map-msgs, grid-map-ros }:
buildRosPackage {
  pname = "ros-humble-grid-map-loader";
  version = "2.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grid_map-release";
    rev = "00f897848b122523aad09b8c55942f91374d40f1";
    owner = "ros2-gbp";
    sha256 = "sha256-LgqxKIlXgMo7GShi1/RuKfNIv32YSu24pfUvWthrIFg=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake grid-map-cmake-helpers ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ grid-map-msgs grid-map-ros ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Loading and publishing grid maps from bag files.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
