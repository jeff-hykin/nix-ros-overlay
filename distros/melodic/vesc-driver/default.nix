
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nodelet, pluginlib, roscpp, roslint, serial, std-msgs, vesc-msgs }:
buildRosPackage {
  pname = "ros-melodic-vesc-driver";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "vesc-release";
    rev = "c2667af97f7ea9470c41299ce190d4760a6d3e9f";
    owner = "f1tenth";
    sha256 = "sha256-8oqBKvY0mOKd/uRgyxBFHkKozmbo7PoQonn/40Xa/Z8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslint ];
  propagatedBuildInputs = [ nodelet pluginlib roscpp serial std-msgs vesc-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS device driver for the Vedder VESC open source motor driver.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
