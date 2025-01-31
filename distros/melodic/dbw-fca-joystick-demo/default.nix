
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dbw-fca-can, dbw-fca-msgs, joy, roscpp, roslaunch, roslib, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-dbw-fca-joystick-demo";
  version = "1.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dbw_fca_ros-release";
    rev = "690e5e9a5160c3024fd51a3293f831e31507da1e";
    owner = "DataspeedInc-release";
    sha256 = "sha256-Fn8+InBX58ewDJm9AyqUOEIDpxZ7KuOgK9en71GBakU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch roslib ];
  propagatedBuildInputs = [ dbw-fca-can dbw-fca-msgs joy roscpp roslaunch sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Demonstration of drive-by-wire with joystick'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
