
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros, mrp2-description }:
buildRosPackage {
  pname = "ros-melodic-mrp2-gazebo";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrp2_simulator-release";
    rev = "7970582abc4d3d91dd85764356595583a1d4df51";
    owner = "milvusrobotics";
    sha256 = "sha256-KBUDPHLz5iDtJG7+au2AIPT5gXZ9cUVQgitKD5elFMc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-ros mrp2-description ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launch files and simulation files to run MRP2 in Gazebo.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
