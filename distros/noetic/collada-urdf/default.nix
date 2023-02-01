
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, assimp, catkin, cmake-modules, collada-dom, collada-parser, eigen, geometric-shapes, resource-retriever, rosconsole, urdf, urdfdom, urdfdom-headers }:
buildRosPackage {
  pname = "ros-noetic-collada-urdf";
  version = "1.12.13-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "collada_urdf-release";
    rev = "f4cccc0e4a073574e3a953e758174a1eddb5f38e";
    owner = "ros-gbp";
    sha256 = "sha256-wCc+mgNvgIJrdphObUrPAAyUhSO2eGhpUNVD0vT9DdU=";
  };

  buildType = "catkin";
  buildInputs = [ angles catkin cmake-modules eigen ];
  propagatedBuildInputs = [ assimp collada-dom collada-parser geometric-shapes resource-retriever rosconsole urdf urdfdom urdfdom-headers ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains a tool to convert Unified Robot Description Format (URDF) documents into COLLAborative Design Activity (COLLADA) documents.

    Implements robot-specific COLLADA extensions as defined by
    http://openrave.programmingvision.com/index.php/Started:COLLADA'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
