
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake }:
buildRosPackage {
  pname = "ros-melodic-sdhlibrary-cpp";
  version = "0.2.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "SDHLibrary-CPP-release";
    rev = "33e24962abb8a0cbb58bdabf8dd63454dc554cda";
    owner = "ipab-slmc";
    sha256 = "sha256-4Fg1zDkpoUwidBGO5S2wWcxswKYv0F01dLW2eu9LdAY=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''This is SDHLibrary-CPP, the C++ library to access
  an SDH (SCHUNK Dexterous Hand)'';
    license = with lib.licenses; [ asl20 ];
  };
}
