
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, openjdk }:
buildRosPackage {
  pname = "ros-foxy-pepper-meshes";
  version = "2.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pepper_meshes2-release";
    rev = "75ae86fe7d11373c124e174339b73b24fd1101ac";
    owner = "ros-naoqi";
    sha256 = "sha256-x7TfmyylvHyBpFrOUKQGtaZikgDGcbMTBbtX4knsxeE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake openjdk ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Meshes for the Pepper robot, for ROS2'';
    license = with lib.licenses; [ "CC-BY-NC-ND-4.0" ];
  };
}
