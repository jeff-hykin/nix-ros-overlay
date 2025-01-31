
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, boost, openssl }:
buildRosPackage {
  pname = "ros-galactic-naoqi-libqi";
  version = "2.9.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libqi-release";
    rev = "4892fa7e58730dc958d8727fbd70f28068562de9";
    owner = "ros-naoqi";
    sha256 = "sha256-7bI4I10C1knEQwAgRkHL6FJyY7UWSBhvuLFTmYlgNmU=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ boost openssl ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Aldebaran's libqi: a core library for NAOqiOS development'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
