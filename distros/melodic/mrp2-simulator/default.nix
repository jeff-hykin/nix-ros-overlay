
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, mrp2-gazebo }:
buildRosPackage {
  pname = "ros-melodic-mrp2-simulator";
  version = "1.0.1-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "milvusrobotics";
        repo = "mrp2_simulator-release";
        rev = "release/melodic/mrp2_simulator/1.0.1-1";
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
