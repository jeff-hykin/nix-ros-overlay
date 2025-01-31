
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros, roscpp, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-velodyne-gazebo-plugins";
  version = "1.0.13-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "velodyne_simulator-release";
    rev = "1a09d58333620d9dbbc79d5fa002d8fd7502bcd9";
    owner = "DataspeedInc-release";
    sha256 = "sha256-L5IN+BvQ38y1lX91dD7v8We1MonA9i21PQRAj+zv7C8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-ros roscpp sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Gazebo plugin to provide simulated data from Velodyne laser scanners.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
