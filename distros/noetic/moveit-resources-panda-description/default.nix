
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-moveit-resources-panda-description";
  version = "0.8.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "moveit_resources-release";
    rev = "fd3e4a44624ff8d4e9e6572ae1b2fec142650455";
    owner = "ros-gbp";
    sha256 = "sha256-xYeqjY/ZAk0xVPuLMy/6DOBsN4IZ6XE6vAJdDbkEpjE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''panda Resources used for MoveIt! testing'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
