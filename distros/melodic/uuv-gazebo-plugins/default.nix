
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, gazebo-dev, protobuf, rosunit }:
buildRosPackage {
  pname = "ros-melodic-uuv-gazebo-plugins";
  version = "0.6.13";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uuv_simulator-release";
    rev = "d80ed3f67aed6187a042331bc9341c51d54f5707";
    owner = "uuvsimulator";
    sha256 = "sha256-l1d9YHDPm2m9VC2jxFi9kRe6b/UJWptEv/rNAqaiJXs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ eigen gazebo-dev protobuf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''UUV Simulator's Gazebo plugins for simulation of hydrodynamic and hydrostatic
    forces, and underwater actuators (e.g. thrusters and fins).'';
    license = with lib.licenses; [ asl20 ];
  };
}
