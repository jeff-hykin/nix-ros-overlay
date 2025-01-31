
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, qt-build, qt4, roscpp, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-qt-tutorials";
  version = "0.2.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "qt_ros-release";
    rev = "5a5ec39930190091032d4f9c5c0970e5f271d0bc";
    owner = "yujinrobot-release";
    sha256 = "sha256-sq6agqTgEWbREd5P4tN7bcNcLQ+kEVACMpgQdbr57Cs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime qt-build qt4 roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Example qt programs, generated from code similar to that used by the 
     roscreate-qt-pkg script and styled on roscpp_tutorials.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
