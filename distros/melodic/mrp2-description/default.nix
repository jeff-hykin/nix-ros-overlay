
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-mrp2-description";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrp2_common-release";
    rev = "130ebd9ddd158088b717b7be157271ddabbed106";
    owner = "milvusrobotics";
    sha256 = "sha256-ES0PCwmenMtLjjHODIdr0ReZMf1AScDrN65D/D7SPbU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp std-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''URDF and xacro description files for MRP2.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
