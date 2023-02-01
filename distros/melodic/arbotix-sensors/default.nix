
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, arbotix-python, catkin }:
buildRosPackage {
  pname = "ros-melodic-arbotix-sensors";
  version = "0.10.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "arbotix_ros-release";
    rev = "7095918b84607bedb36651fcc87b3024eebf3da0";
    owner = "vanadiumlabs";
    sha256 = "sha256-QB6Mvmoov4hFjIgRaHPuG0dDUgWVYInr8J9lPsLajNo=";
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
