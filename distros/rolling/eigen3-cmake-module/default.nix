
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-copyright, ament-cmake-lint-cmake }:
buildRosPackage {
  pname = "ros-rolling-eigen3-cmake-module";
  version = "0.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "eigen3_cmake_module-release";
    rev = "8e5b203c6a90213fe74be617e5909d36af8a0962";
    owner = "ros2-gbp";
    sha256 = "sha256-HYzm0DrBm9AT+4eYJ6+turdRGtO4umPzTYfi/s/x3g4=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Exports a custom CMake module to find Eigen3.'';
    license = with lib.licenses; [ asl20 ];
  };
}
