
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, assimp-devel, catkin, euslisp, pkg-config, roseus }:
buildRosPackage {
  pname = "ros-noetic-eus-assimp";
  version = "0.4.4-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_model_tools-release";
    rev = "826a3153ee412b7b74e87615c4884ddf0203ff75";
    owner = "tork-a";
    sha256 = "sha256-CMHByMDzOib51C2dAVuQsUGaq2BxiaO9DrscI6qlhgo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin euslisp pkg-config ];
  propagatedBuildInputs = [ assimp-devel roseus ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''eus_assimp'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
