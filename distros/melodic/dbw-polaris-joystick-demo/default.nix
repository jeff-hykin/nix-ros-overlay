
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dbw-polaris-can, dbw-polaris-msgs, joy, roscpp, roslaunch, roslib, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-dbw-polaris-joystick-demo";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dbw_polaris_ros-release";
    rev = "e266accb3bfa74292c6f0ab727654b026f1a6012";
    owner = "DataspeedInc-release";
    sha256 = "sha256-IScNwPCoynOnNCzpFxHEM2mRUhyOE6p1ECD0THPCZQs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch roslib ];
  propagatedBuildInputs = [ dbw-polaris-can dbw-polaris-msgs joy roscpp roslaunch sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Demonstration of drive-by-wire with joystick'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
