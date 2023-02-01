
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-clang-format, ament-clang-tidy, ament-cmake, ament-cmake-copyright, ament-cmake-gtest, ament-cmake-lint-cmake, ament-lint-auto, geometry-msgs, tf2-eigen }:
buildRosPackage {
  pname = "ros-humble-affordance-primitives";
  version = "0.1.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "affordance_primitives-release";
    rev = "4314af7d9f5595083ea8dc9b1ad7e597d034c67b";
    owner = "PickNikRobotics";
    sha256 = "sha256-GqEFF/3Ttnk78/fLYfjHlvn3mctvgNnkhS/qTJK/KTM=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-clang-format ament-clang-tidy ament-cmake-copyright ament-cmake-gtest ament-cmake-lint-cmake ament-lint-auto ];
  propagatedBuildInputs = [ geometry-msgs tf2-eigen ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Library for affordance motion primitives.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
