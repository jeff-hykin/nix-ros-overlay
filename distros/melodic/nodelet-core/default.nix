
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nodelet, nodelet-topic-tools }:
buildRosPackage {
  pname = "ros-melodic-nodelet-core";
  version = "1.9.16";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "nodelet_core-release";
    rev = "3903555a8a1f621f2d131411926504082af2a006";
    owner = "ros-gbp";
    sha256 = "sha256-/YgWp46jEpGVCRY8miyT+qfBe6BrJiDhfopO5WJ4w7s=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ nodelet nodelet-topic-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Nodelet Core Metapackage'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
