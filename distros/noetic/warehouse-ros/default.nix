
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, geometry-msgs, gtest, pluginlib, roscpp, rostest, rostime, std-msgs, tf }:
buildRosPackage {
  pname = "ros-noetic-warehouse-ros";
  version = "0.9.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "warehouse_ros-release";
    rev = "e54d8a6c3d15c6d08c6a780d97b61f8999a27331";
    owner = "ros-gbp";
    sha256 = "sha256-8aBMYtKJlumdTSjtOsEop3STuiCIgk6UZGICrWG2zJg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest rostest ];
  propagatedBuildInputs = [ boost geometry-msgs pluginlib roscpp rostime std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Persistent storage of ROS messages'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
