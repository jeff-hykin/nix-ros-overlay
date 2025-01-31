
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-clang-format, ament-cmake-flake8, ament-cmake-pytest, maliput, python3, pythonPackages }:
buildRosPackage {
  pname = "ros-foxy-maliput-py";
  version = "0.1.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "maliput_py-release";
    rev = "1d6e6758f484f8e15c5b362e777037cd651359b2";
    owner = "ros2-gbp";
    sha256 = "sha256-y0KrRQ0yCLLy5tX2Rv0H2iTa9ZqB2ElRWqV9sfPDUcs=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake python3 ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-flake8 ament-cmake-pytest ];
  propagatedBuildInputs = [ maliput pythonPackages.pybind11 ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Maliput bindings'';
    license = with lib.licenses; [ "BSD-Clause-3" ];
  };
}
