
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, rosunit, urdf }:
buildRosPackage {
  pname = "ros-melodic-industrial-utils";
  version = "0.7.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "industrial_core-release";
    rev = "48877e06a4377c9683d7a92b867b36a80a874603";
    owner = "ros-industrial-release";
    sha256 = "sha256-xFWcAajLIgu+PEjw414AY+4VJXsiSKqr6KieVZLBQSk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ roscpp urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Industrial utils is a library package that captures common funcitonality for the ROS-Industrial distribution.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
