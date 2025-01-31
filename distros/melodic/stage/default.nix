
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake, fltk, gtk2, libGL, libGLU, libjpeg, libtool, pkg-config }:
buildRosPackage {
  pname = "ros-melodic-stage";
  version = "4.3.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "stage-release";
    rev = "ee98d472a5dce094f09dce29faa5b799561284e4";
    owner = "ros-gbp";
    sha256 = "sha256-I4psU8+xrEh2p3KAHkSjbhAYz+hzq7GOzqJ2/D6qwEE=";
  };

  buildType = "cmake";
  buildInputs = [ cmake libtool pkg-config ];
  propagatedBuildInputs = [ catkin fltk gtk2 libGL libGLU libjpeg ];
  nativeBuildInputs = [ cmake pkg-config ];

  meta = {
    description = ''Mobile robot simulator http://rtv.github.com/Stage'';
    license = with lib.licenses; [ "GPL" ];
  };
}
