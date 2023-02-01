
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, mrp2-gazebo }:
buildRosPackage {
  pname = "ros-melodic-mrp2-simulator";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrp2_simulator-release";
    rev = "d2c17c0224711103d52f0b4d5bb971d6dfdbd965";
    owner = "milvusrobotics";
    sha256 = "sha256-rwry73M+eOaIvqrkOqR1d6PVdodXApjhoVpjCHDIVCU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ mrp2-gazebo ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Simulation-related packages for MRP2'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
