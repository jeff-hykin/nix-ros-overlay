
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, assimp, boost, catkin, cmake, eigen, ffmpeg, freeglut, libjpeg, libpcap, libusb1, octomap, opencv, python, pythonPackages, suitesparse, udev, wxGTK, zlib }:
buildRosPackage {
  pname = "ros-melodic-mrpt1";
  version = "1.5.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrpt1-release";
    rev = "1b5665da63d6654687ca95b371158b3d1847235b";
    owner = "mrpt-ros-pkg-release";
    sha256 = "sha256-0aPmClQk3GUqao+WQQIWznV19VMHtmrsUJ0J+GYEhpY=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ assimp boost catkin eigen ffmpeg freeglut libjpeg libpcap libusb1 octomap opencv python pythonPackages.numpy suitesparse udev wxGTK zlib ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Mobile Robot Programming Toolkit (MRPT) version 1.5.x'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
