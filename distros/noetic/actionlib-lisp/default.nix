
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, cl-utils, message-runtime, roslisp }:
buildRosPackage {
  pname = "ros-noetic-actionlib-lisp";
  version = "0.2.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roslisp_common-release";
    rev = "78295ab5bdd3eb25de6e5b6e1d4a314b4afbc9e5";
    owner = "ros-gbp";
    sha256 = "sha256-SWRJeH7iYurQCzUdSE7d4xvZKpybsGxHM5s5B7+0TY8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib-msgs cl-utils message-runtime roslisp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''actionlib_lisp is a native implementation of the famous actionlib
   in Common Lisp. It provides a client and a simple server.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
