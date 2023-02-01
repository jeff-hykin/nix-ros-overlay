
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, naoqi-libqi }:
buildRosPackage {
  pname = "ros-foxy-naoqi-libqicore";
  version = "2.9.7";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libqicore-release";
    rev = "db533782fe33fe960efe19ead26c18291e6399dc";
    owner = "ros-naoqi";
    sha256 = "sha256-hLcaaRY2n8iu8LP5doxZNdXajSdJKNeJqmG9V35cmII=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ naoqi-libqi ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Aldebaran's libqicore: a layer on top of libqi'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
