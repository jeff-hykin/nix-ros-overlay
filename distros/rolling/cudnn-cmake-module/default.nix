
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-copyright, ament-cmake-lint-cmake, ament-cmake-xmllint }:
buildRosPackage {
  pname = "ros-rolling-cudnn-cmake-module";
  version = "0.0.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cudnn_cmake_module-release";
    rev = "07fff87ab0a3e735262c29fc1cb69de6fb02de49";
    owner = "ros2-gbp";
    sha256 = "sha256-J6BqQzZzZMC0MVQ5oJCXgXu5fzoPlV+JErISeIuss6I=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Exports a CMake module to find cuDNN.'';
    license = with lib.licenses; [ asl20 ];
  };
}
