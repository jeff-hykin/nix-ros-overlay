
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, dynamixel-workbench-toolbox, eigen, robotis-manipulator, roscpp }:
buildRosPackage {
  pname = "ros-melodic-open-manipulator-p-libs";
  version = "1.0.0-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "open_manipulator_p-release";
    rev = "7cec1eb185f0519fc1cfd07094f875e4e431f193";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-UL8+SP0oztmS+uxtbpZIiVINsCPIwqwikh20JdVvMzM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cmake-modules dynamixel-workbench-toolbox eigen robotis-manipulator roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package for OpenMANIPULATOR-P libraries'';
    license = with lib.licenses; [ asl20 ];
  };
}
