
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, pmb2-2dnav, pmb2-maps }:
buildRosPackage {
  pname = "ros-foxy-pmb2-navigation";
  version = "3.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pmb2_navigation-gbp";
    rev = "70314cbb15ff5a26d91751858bbeef5b774b856b";
    owner = "pal-gbp";
    sha256 = "sha256-9C8PR/s9El5Gss14s/vxW0RhmcnDbcmudih5p22EYG8=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ pmb2-2dnav pmb2-maps ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''PMB2 navigation metapackage'';
    license = with lib.licenses; [ asl20 ];
  };
}
