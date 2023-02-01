
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, urdf, xacro }:
buildRosPackage {
  pname = "ros-noetic-fath-pivot-mount-description";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fath_pivot_mount_description-release";
    rev = "f0c10a5eafcc039c0b001e90861bb13272538ea1";
    owner = "clearpath-gbp";
    sha256 = "sha256-T330klYUS78AFQDqpq/GZy2o49n2tf/5iq7fI5nq8OE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''URDF Macro for adding an adjustable, fath pivot mount used for cameras and other sensors'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
