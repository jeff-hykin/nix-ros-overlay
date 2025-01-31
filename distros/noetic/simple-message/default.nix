
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, industrial-msgs, roscpp, rosunit }:
buildRosPackage {
  pname = "ros-noetic-simple-message";
  version = "0.7.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "industrial_core-release";
    rev = "906d16823059f367ef3f5ed4d29211ce557afbd4";
    owner = "ros-industrial-release";
    sha256 = "sha256-e3VzIL53EqPr6HAracyGAzAxkhG4qoQDU15xOYAE/64=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ industrial-msgs roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''simple_message defines a simple messaging connection and protocol for communicating 
	with an industrial robot controller.  Additional handler and manager classes are 
	included for handling connection limited systems.  This package is part of the ROS-Industrial 
	program.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
