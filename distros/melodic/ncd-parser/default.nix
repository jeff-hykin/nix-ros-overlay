
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-ncd-parser";
  version = "0.3.3-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "scan_tools-release";
    rev = "fad73363620c70409469a73345442561f8f832c3";
    owner = "ros-gbp";
    sha256 = "sha256-rOvQtd9gUVqOGi10cNgMqfMDTWJp/ZomgJe0ldLjp1c=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The ncd_parser package reads in .alog data files from the New College Dataset and broadcasts scan and odometry messages to ROS.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
