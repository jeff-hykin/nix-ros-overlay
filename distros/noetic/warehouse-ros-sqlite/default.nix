
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, class-loader, roscpp, rostest, rostime, sqlite, warehouse-ros }:
buildRosPackage {
  pname = "ros-noetic-warehouse-ros-sqlite";
  version = "0.9.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "warehouse_ros_sqlite-release";
    rev = "1fb01960df9ecbc99ac48bbf0e4b35829c41a38b";
    owner = "ros-gbp";
    sha256 = "sha256-z5/KIpwAXQ1Jg6wVi1hiN+SivA/IgdCfbeK4Bl1EcfY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ class-loader roscpp rostime sqlite warehouse-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Implementation of warehouse_ros for sqlite'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
