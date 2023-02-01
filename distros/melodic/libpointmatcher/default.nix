
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake, eigen, libnabo }:
buildRosPackage {
  pname = "ros-melodic-libpointmatcher";
  version = "1.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libpointmatcher-release";
    rev = "cc408b707aae88ba65675351d8ec4c350acc76ae";
    owner = "nobleo";
    sha256 = "sha256-96czxG0jg3fhdnnpfunDXT5SeulBTS0I2wHxgBhzunA=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ boost catkin eigen libnabo ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''libpointmatcher is a modular ICP library, useful for robotics and computer vision.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
