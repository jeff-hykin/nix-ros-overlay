
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-lint-auto, ament-lint-common, performance-test-fixture, rosidl-runtime-c }:
buildRosPackage {
  pname = "ros-rolling-rosidl-runtime-cpp";
  version = "3.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosidl-release";
    rev = "720088d548edb97aa76b5c306d2ca6ae3ba9d3fb";
    owner = "ros2-gbp";
    sha256 = "sha256-N0Xa4zx33XW6FF/1Y/TFxw6IrXjzAzON4VgbmkluWIU=";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  propagatedBuildInputs = [ ament-cmake rosidl-runtime-c ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Provides definitions and templated functions for getting and working with rosidl typesupport types in C++.'';
    license = with lib.licenses; [ asl20 ];
  };
}
