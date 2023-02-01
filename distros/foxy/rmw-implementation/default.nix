
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-lint-auto, ament-lint-common, performance-test-fixture, rcpputils, rcutils, rmw, rmw-connext-cpp, rmw-cyclonedds-cpp, rmw-fastrtps-cpp, rmw-implementation-cmake }:
buildRosPackage {
  pname = "ros-foxy-rmw-implementation";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmw_implementation-release";
    rev = "7499f9acddd175eeaf777462cf42b3e3c6fb2e89";
    owner = "ros2-gbp";
    sha256 = "sha256-JQotXyje8l24JO7w8k1dA/bYma+v7Z7JWHcGQCAltLw=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rmw rmw-connext-cpp rmw-cyclonedds-cpp rmw-fastrtps-cpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  propagatedBuildInputs = [ rcpputils rcutils rmw-implementation-cmake ];
  nativeBuildInputs = [ ament-cmake rmw-implementation-cmake ];

  meta = {
    description = ''The decision which ROS middleware implementation should be used for C++.'';
    license = with lib.licenses; [ asl20 ];
  };
}
