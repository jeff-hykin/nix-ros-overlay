
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-copyright, ament-cmake-core, ament-cmake-cppcheck, ament-cmake-cpplint, ament-cmake-export-dependencies, ament-cmake-flake8, ament-cmake-lint-cmake, ament-cmake-pep257, ament-cmake-uncrustify, ament-cmake-xmllint }:
buildRosPackage {
  pname = "ros-rolling-ament-lint-common";
  version = "0.13.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_lint-release";
    rev = "421428a20bb033442c5d246ca726d6481ec3f813";
    owner = "ros2-gbp";
    sha256 = "sha256-BciATA3VADUdmQJ171lwXWx9KsGHFT53K+kKBhn/bnE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-export-dependencies ];
  propagatedBuildInputs = [ ament-cmake-copyright ament-cmake-core ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ];
  nativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ];

  meta = {
    description = ''The list of commonly used linters in the ament build system in CMake.'';
    license = with lib.licenses; [ asl20 ];
  };
}
