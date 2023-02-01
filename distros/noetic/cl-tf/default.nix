
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cl-transforms, cl-transforms-stamped, roslisp, tf }:
buildRosPackage {
  pname = "ros-noetic-cl-tf";
  version = "0.2.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roslisp_common-release";
    rev = "dfd1260543bed199c8ef5749dfd60acdf0bc393b";
    owner = "ros-gbp";
    sha256 = "sha256-xaRXFfPNz9pKlS01bdnVDGGYtA1FppBZbtN/DdPJ33k=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cl-transforms cl-transforms-stamped roslisp tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Client implementation to use TF from Common Lisp'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
