
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-build, ecl-license }:
buildRosPackage {
  pname = "ros-noetic-ecl-config";
  version = "0.61.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_lite-release";
    rev = "5d33049066af3595db342db3c56377586d524dde";
    owner = "yujinrobot-release";
    sha256 = "sha256-0sot7I/1wIJE2Wd8WYEO3uM9LqX1znaq7dIaEKD91kk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ecl-build ecl-license ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''These tools inspect and describe your system with macros, types 
     and functions.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
