
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros }:
buildRosPackage {
  pname = "ros-melodic-blender-gazebo";
  version = "0.0.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "blender_gazebo_gbp";
    rev = "864c51ec584c344187a4e82a2c3b4e0c1556bc10";
    owner = "david0429-gbp";
    sha256 = "sha256-fFBi+usLcfPYmYW+qOyP8XIbhiAa4A2PSh7/75bA8XI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The blender_gazebo package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
