
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake, gtest, ros-industrial-cmake-boilerplate, tesseract-common }:
buildRosPackage {
  pname = "ros-noetic-tesseract-support";
  version = "0.13.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tesseract-release";
    rev = "14c831acdcfb205bbff34ff25a0ac4ffd61d971c";
    owner = "ros-industrial-release";
    sha256 = "sha256-y1073V4r2h3V4isF/u5a1jui4F1L0Pck4t4B6jSqfLc=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ros-industrial-cmake-boilerplate tesseract-common ];
  checkInputs = [ gtest ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''The tesseract_support package containing files for test and examples'';
    license = with lib.licenses; [ asl20 ];
  };
}
