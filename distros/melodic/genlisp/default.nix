
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, genmsg }:
buildRosPackage {
  pname = "ros-melodic-genlisp";
  version = "0.4.16";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "genlisp-release";
    rev = "93651e05e465c91a242a759a421d6504f9c59fe6";
    owner = "ros-gbp";
    sha256 = "sha256-rgb3lhBFBIDQIg6NuajQYdKy7o3KNa+rMv5AFAL1zWI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ genmsg ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Common-Lisp ROS message and service generators.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
