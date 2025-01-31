
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-clang-format, ament-cmake-gtest, ament-cmake-pytest, maliput, maliput-py, python3, pythonPackages }:
buildRosPackage {
  pname = "ros-foxy-maliput-dragway";
  version = "0.1.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "maliput_dragway-release";
    rev = "2be54cd0231f74b4b9d1867722104e494e34f01d";
    owner = "ros2-gbp";
    sha256 = "sha256-ge0ey8sqPEQD4jDX+BSlUDK65hZIJNfQ8Q+LApWpyyM=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-gtest ament-cmake-pytest ];
  propagatedBuildInputs = [ maliput maliput-py python3 pythonPackages.pybind11 ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Maliput Dragway.'';
    license = with lib.licenses; [ "BSD-Clause-3" ];
  };
}
