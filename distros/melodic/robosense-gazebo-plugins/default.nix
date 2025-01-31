
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros, roscpp, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-robosense-gazebo-plugins";
  version = "1.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robosense_simulator_release";
    rev = "136a963d6cedb5d50d3d9ae5fbfcc7224e177ac4";
    owner = "tomlogan501";
    sha256 = "sha256-txECBSl4BgtXZTb7hHQC6eCa/VbArXVhgimv6quXVPs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-ros roscpp sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Gazebo plugin to provide simulated data from Robosense laser scanners.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
