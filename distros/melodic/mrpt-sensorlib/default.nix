
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, mrpt-msgs, mrpt2, roscpp, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-mrpt-sensorlib";
  version = "0.0.2-r1";

  src = fetchurl {
    url = "https://github.com/mrpt-ros-pkg-release/mrpt_sensors-release/archive/d6848f2484811372f0810a1a9496f87a5026ef33.tar.gz";
    sha256 = "sha256-qSgppjhZk98hlF7X1tscTHmd6lnIQTJkpO9MpADFCx4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs message-generation message-runtime mrpt-msgs mrpt2 roscpp sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''C++ library for the base generic MRPT sensor node'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
