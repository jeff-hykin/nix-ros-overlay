
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros-control }:
buildRosPackage {
  pname = "ros-noetic-khi-duaro-gazebo";
  version = "1.3.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "khi_robot-release";
    rev = "d7b4787e7cce11836007d044e652b871f7baeb9a";
    owner = "Kawasaki-Robotics";
    sha256 = "sha256-WQmZ/EPwuZL5RBhxOzD8I3/tjURyDBOUZ8GUJg6lFa8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin gazebo-ros-control ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The khi_duaro_gazebo package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
