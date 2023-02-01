
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-lint-cmake, ament-cmake-xmllint, ament-lint-auto }:
buildRosPackage {
  pname = "ros-rolling-acado-vendor";
  version = "1.0.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "acado_vendor-release";
    rev = "d9be5bd693d7a6e8e9b7ee3050a94bada7ad2596";
    owner = "ros2-gbp";
    sha256 = "sha256-8gA7ZwANcFmzyoc3egAGyB3xpAQlHrs4nK6U1/KanwA=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''ament package for ACADO toolkit for MPC code generation'';
    license = with lib.licenses; [ asl20 ];
  };
}
