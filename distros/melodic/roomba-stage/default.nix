
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, fake-localization, map-server, move-base, stage-ros }:
buildRosPackage {
  pname = "ros-melodic-roomba-stage";
  version = "0.2.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_tutorials-release";
    rev = "90c3823da186db08dfa6a1f120422e0814b5789a";
    owner = "ros-gbp";
    sha256 = "sha256-cD+Dv6Qv9hN1Qhm+7ETaNSMUjqu+F8GeNSDI8I27oKE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ fake-localization map-server move-base stage-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The roomba_stage package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
