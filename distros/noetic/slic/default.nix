
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cacert, cmake, cmake-modules, git, opencv, openssl }:
buildRosPackage {
  pname = "ros-noetic-slic";
  version = "2.1.21-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_3rdparty-release";
    rev = "eaf1f04cb1e6a47c05d599f057688e9d655993bc";
    owner = "tork-a";
    sha256 = "sha256-dpLmpMrnH5aTuLH1zyaX5GxQ1yZwMP62D3K4iN0DyaM=";
  };

  buildType = "cmake";
  buildInputs = [ cacert cmake cmake-modules git openssl ];
  propagatedBuildInputs = [ opencv ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''SLIC-Superpizel ROS Wrapper
  This file contains the class elements of the class Slic. This class is an
  implementation of the SLIC Superpixel algorithm by Achanta et al. [PAMI'12,
  vol. 34, num. 11, pp. 2274-2282].

  This implementation is created for the specific purpose of creating
  over-segmentations in an OpenCV-based environment.'';
    license = with lib.licenses; [ "N-A" ];
  };
}
