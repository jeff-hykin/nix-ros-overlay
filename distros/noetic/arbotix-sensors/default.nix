
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, arbotix-python, catkin }:
buildRosPackage {
  pname = "ros-noetic-arbotix-sensors";
  version = "0.11.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "arbotix_ros-release";
    rev = "ac1a1e2062161cb205e3452e69ed5ff4598c18eb";
    owner = "vanadiumlabs";
    sha256 = "sha256-GiWTQHwpWt5V1KdFH9rEIzVeqBu4U1/SNRoYWAU3ojU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ arbotix-python ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Extends the arbotix_node package with a number of more sophisticated ROS wrappers for common devices.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
