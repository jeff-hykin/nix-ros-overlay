
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-clang-format, ament-cmake-gmock, ament-cmake-gtest, fmt, gflags, libyamlcpp }:
buildRosPackage {
  pname = "ros-foxy-maliput";
  version = "1.0.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "maliput-release";
    rev = "885525830d1e991c3cf2f7b3c5680d7179c84522";
    owner = "ros2-gbp";
    sha256 = "sha256-QamvxvLy55xN2uiQs4ZbbYPbrSKwojZri21Ft9uJqjg=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-gmock ament-cmake-gtest ];
  propagatedBuildInputs = [ fmt gflags libyamlcpp ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Maliput'';
    license = with lib.licenses; [ "BSD-Clause-3" ];
  };
}
