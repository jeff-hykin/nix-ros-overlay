
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-lint-auto, ament-lint-common, git, libyaml, performance-test-fixture, pkg-config, rcpputils, rcutils }:
buildRosPackage {
  pname = "ros-rolling-libyaml-vendor";
  version = "1.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libyaml_vendor-release";
    rev = "b4f854877e33626e13942faa5f4c0a46e1f0feaa";
    owner = "ros2-gbp";
    sha256 = "sha256-B2uqS9U3CPThw71pjdP7RBBkjyBN8DlCbibIR3rmS80=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake git ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture rcpputils rcutils ];
  propagatedBuildInputs = [ libyaml pkg-config ];
  nativeBuildInputs = [ ament-cmake git pkg-config ];

  meta = {
    description = ''Vendored version of libyaml.'';
    license = with lib.licenses; [ asl20 mit ];
  };
}
