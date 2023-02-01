
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core }:
buildRosPackage {
  pname = "ros-humble-ament-cmake-version";
  version = "1.3.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_cmake-release";
    rev = "dc3b0a65eba57d72066a97bf8331fd07138c25bd";
    owner = "ros2-gbp";
    sha256 = "sha256-u2pk+dUmYOB7uMOrx0/aPdWk+YyL+icx/aRPdEbG+3E=";
  };

  buildType = "ament_cmake";
  propagatedBuildInputs = [ ament-cmake-core ];
  nativeBuildInputs = [ ament-cmake-core ];

  meta = {
    description = ''The ability to override the exported package version in the ament buildsystem.'';
    license = with lib.licenses; [ asl20 ];
  };
}
