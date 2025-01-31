
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, image-common, image-pipeline, image-transport-plugins, laser-filters, laser-geometry, perception-pcl, ros-base, vision-opencv }:
buildRosPackage {
  pname = "ros-humble-perception";
  version = "0.10.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "variants-release";
    rev = "2e16118c7eee6c0b31314b2f6d406449687a0e5f";
    owner = "ros2-gbp";
    sha256 = "sha256-c9lGVLwPCuMSbgiHggs37sSu7II5YKdn0ruTBwk2wMs=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-common image-pipeline image-transport-plugins laser-filters laser-geometry perception-pcl ros-base vision-opencv ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''A package which aggregates common perception packages.'';
    license = with lib.licenses; [ asl20 ];
  };
}
