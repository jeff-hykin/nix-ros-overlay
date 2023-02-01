
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, orocos-kdl, rosconsole, roscpp, rostest, tinyxml, tinyxml-2, urdf, urdfdom-headers }:
buildRosPackage {
  pname = "ros-melodic-kdl-parser";
  version = "1.13.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "kdl_parser-release";
    rev = "ea504b05f34457fdeb3726d9ecf77f8f7e788eb9";
    owner = "ros-gbp";
    sha256 = "sha256-1T9TC1HeOGAK+pNgNwOLjNmaAASsBCIquIt3DMdsl6w=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules ];
  checkInputs = [ roscpp rostest ];
  propagatedBuildInputs = [ orocos-kdl rosconsole tinyxml tinyxml-2 urdf urdfdom-headers ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The Kinematics and Dynamics Library (KDL) defines a tree structure
   to represent the kinematic and dynamic parameters of a robot
   mechanism. <tt>kdl_parser</tt> provides tools to construct a KDL
   tree from an XML robot representation in URDF.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
