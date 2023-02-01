
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, catkin-virtualenv, roseus, slime-ros }:
buildRosPackage {
  pname = "ros-noetic-euslime";
  version = "1.1.4-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "euslime-release";
    rev = "4530be1a9ed654e0e51a63f710321b202b0d15bb";
    owner = "jsk-ros-pkg";
    sha256 = "sha256-THE3p1Yz+wOa5fYMaN+S4CZpjQFV/JtFrjXeX7A6jZk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin catkin-virtualenv ];
  propagatedBuildInputs = [ roseus slime-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''EusLisp meets SLIME'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
