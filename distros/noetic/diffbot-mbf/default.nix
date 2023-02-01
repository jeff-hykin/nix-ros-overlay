
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-diffbot-mbf";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "diffbot-release";
    rev = "86cf34e04c99c38a705b1e21f4600bf73bd5c97f";
    owner = "ros-mobile-robots-release";
    sha256 = "sha256-2R85w8ridvqhdpFHfdbsC80dWCZx7TipOdSetgAKITI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The diffbot_mbf package'';
    license = with lib.licenses; [ gpl3Only ];
  };
}
