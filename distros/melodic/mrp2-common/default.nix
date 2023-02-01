
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, mrp2-description, mrp2-navigation, mrp2-teleop }:
buildRosPackage {
  pname = "ros-melodic-mrp2-common";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrp2_common-release";
    rev = "513c5b1235c47635f697190a56bbd0c583b14633";
    owner = "milvusrobotics";
    sha256 = "sha256-KYZdO01TXcuBPHdWDqYGdvOtPoPKXSBSH3j6YjZXC8Y=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ mrp2-description mrp2-navigation mrp2-teleop ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Necessary packages in common for both simulation and real environment.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
