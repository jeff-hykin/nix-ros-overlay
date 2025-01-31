
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rr-control-input-manager, rr-openrover-description, rr-openrover-driver, rr-openrover-driver-msgs, rr-openrover-simulation, rr-rover-zero-driver }:
buildRosPackage {
  pname = "ros-melodic-rr-openrover-stack";
  version = "1.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rr_openrover_stack-release";
    rev = "f040b2c47e6c1ea4b48776cbf2f19c5c92a76224";
    owner = "RoverRobotics-release";
    sha256 = "sha256-n5TVxSbBX3K415By96nXHStFhCPbOE2c6XEtzOZ76lE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rr-control-input-manager rr-openrover-description rr-openrover-driver rr-openrover-driver-msgs rr-openrover-simulation rr-rover-zero-driver ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Packages related to the operation of Rover Robotics rover hardware.  This includes a client
    for interfacing with the hardware (rr_openrover_driver) and a tool for filtering time stamped
    velocity commands (rr_control_input_manager).'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
