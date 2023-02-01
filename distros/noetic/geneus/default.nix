
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, genmsg, python3Packages }:
buildRosPackage {
  pname = "ros-noetic-geneus";
  version = "3.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "geneus-release";
    rev = "c56ec9cf504d179e4a58dadb12f60c262096fc54";
    owner = "tork-a";
    sha256 = "sha256-p/HgY3tR98Dq1bbT6ipQdZJgUhXQcfVAlDLp3QxHUko=";
  };

  buildType = "catkin";
  buildInputs = [ catkin python3Packages.setuptools ];
  propagatedBuildInputs = [ genmsg ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''EusLisp ROS message and service generators.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
