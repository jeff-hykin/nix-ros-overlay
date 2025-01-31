
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roslint, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-color-util";
  version = "0.3.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_navigation-release";
    rev = "83ee75ae697d803c6141ac93679f470f860d3fde";
    owner = "DLu";
    sha256 = "sha256-jPlMr4t8eeeqJOIX/lVOF7L6Xy6obFj7CTvVeZjl7hw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint ];
  propagatedBuildInputs = [ std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''An almost dependency-less library for converting between color spaces'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
