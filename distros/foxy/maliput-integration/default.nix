
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-clang-format, ament-cmake-flake8, ament-cmake-gtest, ament-cmake-pytest, gflags, libyamlcpp, maliput, maliput-dragway, maliput-malidrive, maliput-multilane, maliput-object, maliput-osm, maliput-py, maliput-sparse }:
buildRosPackage {
  pname = "ros-foxy-maliput-integration";
  version = "0.1.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "maliput_integration-release";
    rev = "aa848bd11d0a417c59805b8f6cdf4d19e4686eba";
    owner = "ros2-gbp";
    sha256 = "sha256-1FWPk+oZ0Xl3Tuc9dTlEpRhBeevXuPskgMJTzapLsTE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-flake8 ament-cmake-gtest ament-cmake-pytest ];
  propagatedBuildInputs = [ gflags libyamlcpp maliput maliput-dragway maliput-malidrive maliput-multilane maliput-object maliput-osm maliput-py maliput-sparse ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Maliput Integration.'';
    license = with lib.licenses; [ bsd3 ];
  };
}
