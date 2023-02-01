
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, ament-lint-auto, ament-lint-common, launch-pal, pmb2-2dnav }:
buildRosPackage {
  pname = "ros-humble-tiago-2dnav";
  version = "4.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tiago_navigation-release";
    rev = "ae109750f8cf7c73d9ceac156c1b8bde391320ae";
    owner = "pal-gbp";
    sha256 = "sha256-oP6oDB3Y0dSgLoK+1+0IEvdkRTkigcPz2682vMGbjLg=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ launch-pal pmb2-2dnav ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''TIAGo-specific launch files needed to run navigation on a TIAGo robot.'';
    license = with lib.licenses; [ asl20 ];
  };
}
