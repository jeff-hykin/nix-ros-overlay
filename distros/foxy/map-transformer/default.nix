
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-ros, ament-lint-auto, ament-lint-common, opencv, yaml-cpp-vendor }:
buildRosPackage {
  pname = "ros-foxy-map-transformer";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "map_transformer-release";
    rev = "fefb1ba4595a20d07b9cf9f6225f04fba788f607";
    owner = "ros-gbp";
    sha256 = "sha256-nSfWYekaZN2AK0OOrhM5iiLKNhVPTEMyNwqza2uaeOw=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ opencv yaml-cpp-vendor ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''Transform points between maps with non-linear relationships'';
    license = with lib.licenses; [ asl20 ];
  };
}
