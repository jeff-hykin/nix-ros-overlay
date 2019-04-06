
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pkg-config, cppunit, eigen, cmake }:
buildRosPackage {
  pname = "ros-kinetic-orocos-kdl";
  version = "1.3.1";

  src = fetchurl {
    url = https://github.com/smits/orocos-kdl-release/archive/release/kinetic/orocos_kdl/1.3.1-0.tar.gz;
    sha256 = "7cbda0a837a7025739715ffab17b5f916d671eec8dfeb26a20ba80bfc0463590";
  };

  checkInputs = [ cppunit ];
  propagatedBuildInputs = [ catkin pkg-config eigen ];
  nativeBuildInputs = [ cmake eigen ];

  meta = {
    description = ''This package contains a recent version of the Kinematics and Dynamics
    Library (KDL), distributed by the Orocos Project.'';
    #license = lib.licenses.LGPL;
  };
}