
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core, ament-cmake-include-directories, ament-cmake-libraries }:
buildRosPackage {
  pname = "ros-rolling-ament-cmake-target-dependencies";
  version = "1.5.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_cmake-release";
    rev = "dde219cb5cbf788480c48e4d2b9facb9aa68267a";
    owner = "ros2-gbp";
    sha256 = "sha256-ofsSAAu3jfBd9LpqeE9YMdGdGKYSv8ZV8jGrm42xuAc=";
  };

  buildType = "ament_cmake";
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ];
  nativeBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ];

  meta = {
    description = ''The ability to add definitions, include directories and libraries of a package to a target in the ament buildsystem in CMake.'';
    license = with lib.licenses; [ asl20 ];
  };
}
