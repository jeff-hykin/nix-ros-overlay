
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core, ament-cmake-export-definitions, ament-cmake-export-dependencies, ament-cmake-export-include-directories, ament-cmake-export-interfaces, ament-cmake-export-libraries, ament-cmake-export-link-flags, ament-cmake-export-targets, ament-cmake-libraries, ament-cmake-python, ament-cmake-target-dependencies, ament-cmake-test, ament-cmake-version, cmake }:
buildRosPackage {
  pname = "ros-foxy-ament-cmake";
  version = "0.9.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_cmake-release";
    rev = "7349cbf413cc8d0e45f9dd7dfda22c1d497fb27c";
    owner = "ros2-gbp";
    sha256 = "sha256-RIp9l+7X2EKNQ4uMZKJHHsEveMsvAA2unKkKrtUCecM=";
  };

  buildType = "ament_cmake";
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-definitions ament-cmake-export-dependencies ament-cmake-export-include-directories ament-cmake-export-interfaces ament-cmake-export-libraries ament-cmake-export-link-flags ament-cmake-export-targets ament-cmake-libraries ament-cmake-python ament-cmake-target-dependencies ament-cmake-test ament-cmake-version cmake ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''The entry point package for the ament buildsystem in CMake.'';
    license = with lib.licenses; [ asl20 ];
  };
}
