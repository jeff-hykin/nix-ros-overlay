
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, git, ros-environment }:
buildRosPackage {
  pname = "ros-galactic-osqp-vendor";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "osqp_vendor-release";
    rev = "4946af6b328847b92750822507993d65d2a51c5f";
    owner = "ros2-gbp";
    sha256 = "sha256-I6jhthmRppj6fiDd1M+bbW8W/bsR5/0ur5UWcf4/ZGQ=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake git ros-environment ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  nativeBuildInputs = [ ament-cmake git ];

  meta = {
    description = ''Wrapper around osqp that ships with a CMake module'';
    license = with lib.licenses; [ asl20 ];
  };
}
