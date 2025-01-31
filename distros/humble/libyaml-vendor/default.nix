
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-lint-auto, ament-lint-common, git, performance-test-fixture, rcpputils }:
buildRosPackage {
  pname = "ros-humble-libyaml-vendor";
  version = "1.2.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libyaml_vendor-release";
    rev = "6b016f94f158b7ab8e9775a7812aad155ea8e5ce";
    owner = "ros2-gbp";
    sha256 = "sha256-T5lFkF1emYzuuMStlx2KaxQi3nBCsnHhEmB9UBs1FDI=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake git ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture rcpputils ];
  nativeBuildInputs = [ ament-cmake git ];

  meta = {
    description = ''Vendored version of libyaml.'';
    license = with lib.licenses; [ asl20 mit ];
  };
}
