
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, flexbe-core, flexbe-msgs, rospy, rostest, rosunit, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-flexbe-testing";
  version = "1.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "flexbe_behavior_engine-release";
    rev = "f1587100b209daa3a02ec79519e3a343c1f3a3ef";
    owner = "FlexBE";
    sha256 = "sha256-neird5Imdab1x1RdDbJrMD0iUfR/x2PNkQ29tfRG6Bs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin rostest ];
  checkInputs = [ rosunit std-msgs ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''flexbe_testing provides a framework for unit testing states.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
