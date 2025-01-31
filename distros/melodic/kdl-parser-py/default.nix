
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python-orocos-kdl, pythonPackages, rostest, urdfdom-py }:
buildRosPackage {
  pname = "ros-melodic-kdl-parser-py";
  version = "1.13.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "kdl_parser-release";
    rev = "7b79bbd9d864ad2e7ed6cd3b7e9012ff5be2ee4a";
    owner = "ros-gbp";
    sha256 = "sha256-KDV2+mx7xlP45jEWJctpCLN9dBS4F/Reo9lq8iMKtGA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pythonPackages.catkin-pkg pythonPackages.setuptools ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ python-orocos-kdl urdfdom-py ];
  nativeBuildInputs = [ catkin pythonPackages.catkin-pkg pythonPackages.setuptools ];

  meta = {
    description = ''The Kinematics and Dynamics Library (KDL) defines a tree structure
   to represent the kinematic and dynamic parameters of a robot
   mechanism. <tt>kdl_parser_py</tt> provides Python tools to construct a KDL
   tree from an XML robot representation in URDF.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
