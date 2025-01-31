
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, tiago-2dnav }:
buildRosPackage {
  pname = "ros-humble-tiago-navigation";
  version = "4.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tiago_navigation-release";
    rev = "6d3ee3607cf285364c5d7e7639d95c66422cc554";
    owner = "pal-gbp";
    sha256 = "sha256-pxhRA39eZM3HlGeM490qFiNo1YZ3QBrD8HWli7ssP3Q=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ tiago-2dnav ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''TIAGo navigation metapackage'';
    license = with lib.licenses; [ asl20 ];
  };
}
