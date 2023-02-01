
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rospy, rosserial-client, rosserial-python }:
buildRosPackage {
  pname = "ros-melodic-rosserial-vex-cortex";
  version = "0.8.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosserial-release";
    rev = "5da7e05192046248b9c6806bfaf6acea2443b8a2";
    owner = "ros-gbp";
    sha256 = "sha256-Ao4pV/bCPyqzURorOw7W8IbCtkk3tyAB/O3ttB/PMd8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rospy rosserial-client rosserial-python ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rosserial for Cortex/AVR platforms.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
