
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-ieee80211-channels";
  version = "1.0.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "linux_networking-release";
    rev = "231c9b506f5b99bf3c95711a828aa04e5beb9f41";
    owner = "pr2-gbp";
    sha256 = "sha256-bHk/M/QsOKp44WbPGrSUQ1xh5aoYyg6dvtc/JKmb7N4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides mapping from frequencies to
    IEEE802.11 channels and vice-versa.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
