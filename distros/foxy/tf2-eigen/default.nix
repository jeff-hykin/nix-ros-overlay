
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, eigen, eigen3-cmake-module, geometry-msgs, tf2, tf2-ros }:
buildRosPackage {
  pname = "ros-foxy-tf2-eigen";
  version = "0.13.13-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "geometry2-release";
    rev = "0a75a5073dbf1c90ab94347355e09bad7666b712";
    owner = "ros2-gbp";
    sha256 = "sha256-Oq4/hP/HTGmjfp+0fI/HLd4c90+Mpgp5ziNz7SbDO0o=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ];
  propagatedBuildInputs = [ eigen eigen3-cmake-module geometry-msgs tf2 tf2-ros ];
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ];

  meta = {
    description = ''tf2_eigen'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
