
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, roslaunch, rostest, soem }:
buildRosPackage {
  pname = "ros-melodic-ethercat-manager";
  version = "1.0.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "minas-release";
    rev = "3eb65c1b95e8fb0e5b5e184c32e9f39f417f5ee4";
    owner = "tork-a";
    sha256 = "sha256-qamTb4KFwTvj1RBvyB5F7baOZnpy/aNxjIkRej1TuGo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ roscpp soem ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS-Industrial support stack for facilitating communication with
EtherCAT networks. The code is mainly copied from https://github.com/ros-industrial/robotiq/blob/jade-devel/robotiq_ethercat/src/ethercat_manager.cpp'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
