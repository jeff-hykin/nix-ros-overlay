
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, clang, cmake, console-bridge, eigen, gtest, lcov, libyamlcpp, ros-industrial-cmake-boilerplate, tinyxml-2 }:
buildRosPackage {
  pname = "ros-noetic-tesseract-common";
  version = "0.13.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tesseract-release";
    rev = "3532385ff344dd44a9ab18127bbf60b3fe712e1a";
    owner = "ros-industrial-release";
    sha256 = "sha256-sP6U1vl2/Q9GnuueAP5hE00NLA7nv/yzXMvxdI+pWnY=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ros-industrial-cmake-boilerplate ];
  checkInputs = [ clang gtest lcov ];
  propagatedBuildInputs = [ boost console-bridge eigen libyamlcpp tinyxml-2 ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Contains common macros, utils and types used throughout'';
    license = with lib.licenses; [ asl20 ];
  };
}
