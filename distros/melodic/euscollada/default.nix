
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, assimp-devel, catkin, cmake-modules, collada-dom, collada-parser, collada-urdf, libyamlcpp, mk, openhrp3, pr2-description, qhull, resource-retriever, rosboost-cfg, rosbuild, roscpp, roseus, rospack, rostest, tf, urdf, urdfdom }:
buildRosPackage {
  pname = "ros-melodic-euscollada";
  version = "0.4.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_model_tools-release";
    rev = "e2c8d3da95f75dc2a5464f4b0030fe5d60a56b4e";
    owner = "tork-a";
    sha256 = "sha256-Z65Xvzg6tZ/MsnAwlyRNAVZFKaPQ1QUVOwJU02CmTnA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules mk rosboost-cfg rosbuild ];
  checkInputs = [ openhrp3 pr2-description roseus ];
  propagatedBuildInputs = [ assimp-devel collada-dom collada-parser collada-urdf libyamlcpp qhull resource-retriever roscpp rospack rostest tf urdf urdfdom ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''euscollada'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
