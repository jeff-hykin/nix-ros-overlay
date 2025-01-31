
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-clang-format, ament-cmake-gmock, ament-cmake-gtest, fmt, libyamlcpp, maliput, maliput-drake }:
buildRosPackage {
  pname = "ros-foxy-maliput-multilane";
  version = "0.1.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "maliput_multilane-release";
    rev = "b3ae26899fdc0f436f496950a8b97e1a59eebffb";
    owner = "ros2-gbp";
    sha256 = "sha256-T0buTlxWJ9e9e5edq40TBU1WbnhsFK1VXnzdOuS1/GE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-gmock ament-cmake-gtest ];
  propagatedBuildInputs = [ fmt libyamlcpp maliput maliput-drake ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Maliput Multilane.'';
    license = with lib.licenses; [ bsd3 ];
  };
}
