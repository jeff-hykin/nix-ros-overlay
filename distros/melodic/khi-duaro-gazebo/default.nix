
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros-control }:
buildRosPackage {
  pname = "ros-melodic-khi-duaro-gazebo";
  version = "1.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "khi_robot-release";
    rev = "f829245225b838dbfb1f278242e000d043abd0e1";
    owner = "Kawasaki-Robotics";
    sha256 = "sha256-imNhui4ZOFlRsfuHLJhd/3HcIBgENbFMA/hVBSup5TI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin gazebo-ros-control ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The khi_duaro_gazebo package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
