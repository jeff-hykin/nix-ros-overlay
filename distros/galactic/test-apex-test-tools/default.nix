
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, ament-lint-auto, apex-test-tools }:
buildRosPackage {
  pname = "ros-galactic-test-apex-test-tools";
  version = "0.0.2-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "apex_test_tools-release";
    rev = "444d5680ea805a63c384fa07d29930c1c2e82eb2";
    owner = "ros2-gbp";
    sha256 = "sha256-ZB2lhFknuQ+9fA1s+tCKrhHEUOnSLF2ogSsE0tVMrjE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto ];
  checkInputs = [ ament-lint-auto apex-test-tools ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''Test package, which uses things exported by apex_test_tools'';
    license = with lib.licenses; [ asl20 ];
  };
}
