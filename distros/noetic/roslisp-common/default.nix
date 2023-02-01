
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-lisp, catkin, cl-tf, cl-tf2, cl-transforms, cl-transforms-stamped, cl-urdf, cl-utils, roslisp-utilities }:
buildRosPackage {
  pname = "ros-noetic-roslisp-common";
  version = "0.2.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roslisp_common-release";
    rev = "0b51ccaa45c5f940c4d34186958e304f3b860b0d";
    owner = "ros-gbp";
    sha256 = "sha256-miJA/miFnZekOvXqh4+fK+rgDTEwP7Uu899kgwjziqI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib-lisp cl-tf cl-tf2 cl-transforms cl-transforms-stamped cl-urdf cl-utils roslisp-utilities ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Common libraries to control ROS based robots. This stack contains
    an implementation of actionlib (client and server) in Common Lisp,
    a transformation library and an implementation of tf in Common
    Lisp.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
