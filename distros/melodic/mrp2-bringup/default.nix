
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, joy, joy-teleop, mrp2-description, robot-state-publisher, twist-mux, urg-node }:
buildRosPackage {
  pname = "ros-melodic-mrp2-bringup";
  version = "0.2.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrp2_robot-release";
    rev = "0b13ed328fa99860123d9bcbaf76bfe63ee079a9";
    owner = "milvusrobotics";
    sha256 = "sha256-fr2Jlmr66aPAxvCnD9uCw3yYT8zCB0ST5+/JtgpTviY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ joy joy-teleop mrp2-description robot-state-publisher twist-mux urg-node ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launch files and configurations for starting MRP2 robot in a real environment.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
