
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, dynamixel-workbench-toolbox, eigen, robotis-manipulator, roscpp }:
buildRosPackage {
  pname = "ros-melodic-open-manipulator-p-libs";
  version = "1.0.0-r5";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "ROBOTIS-GIT-release";
        repo = "open_manipulator_p-release";
        rev = "release/melodic/open_manipulator_p_libs/1.0.0-5";
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
