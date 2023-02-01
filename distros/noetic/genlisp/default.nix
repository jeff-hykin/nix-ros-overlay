
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, genmsg, python3Packages }:
buildRosPackage {
  pname = "ros-noetic-genlisp";
  version = "0.4.18-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "genlisp-release";
    rev = "25a5501e47cf569e5d04fd3e35484de9fe7069b5";
    owner = "ros-gbp";
    sha256 = "sha256-UgWHIS/LzbhADIgpPqQfEp3puhfuFJReDMWgvaUywd4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin python3Packages.setuptools ];
  propagatedBuildInputs = [ genmsg ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''Common-Lisp ROS message and service generators.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
