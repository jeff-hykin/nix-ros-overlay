
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamixel-workbench-controllers, dynamixel-workbench-operators, dynamixel-workbench-toolbox }:
buildRosPackage {
  pname = "ros-melodic-dynamixel-workbench";
  version = "2.2.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dynamixel-workbench-release";
    rev = "b4bdd3712daf0b698ad169a7db0207c35b4659ed";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-bTX0JKVxB2UF/ugYkm00pOocZ1dLX0Vi8sOqZmeM8gQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamixel-workbench-controllers dynamixel-workbench-operators dynamixel-workbench-toolbox ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Dynamixel-Workbench is dynamixel solution for ROS.
    This metapackage allows you to easily change the ID, baudrate and operating mode of the Dynamixel.
    Furthermore, it supports various controllers based on operating mode and Dynamixel SDK.
    These controllers are commanded by operators.'';
    license = with lib.licenses; [ asl20 ];
  };
}
