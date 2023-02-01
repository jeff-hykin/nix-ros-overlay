
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-clang-format, ament-cmake-gtest, fmt, maliput, maliput-drake, tinyxml-2 }:
buildRosPackage {
  pname = "ros-foxy-maliput-malidrive";
  version = "0.1.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "maliput_malidrive-release";
    rev = "27bdc7b2a85914d9750b2b3a0cde9ae5b0b6a4ca";
    owner = "ros2-gbp";
    sha256 = "sha256-33AWyr13E5StNrkmBtJjWdsjDdkKT0TsUQryjcY4dCk=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-gtest ];
  propagatedBuildInputs = [ fmt maliput maliput-drake tinyxml-2 ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''maliput_malidrive backend'';
    license = with lib.licenses; [ "BSD-Clause-3" ];
  };
}
