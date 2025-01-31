
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, cl-utils, message-runtime, roslisp }:
buildRosPackage {
  pname = "ros-melodic-actionlib-lisp";
  version = "0.2.13-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roslisp_common-release";
    rev = "5fd9c23a2fe6461a9a457fbfc06256eb9c0cce7e";
    owner = "ros-gbp";
    sha256 = "sha256-R75GiJU4j+LfOFC0uzJNOlg8tVW+AYaOlYgNbKHRlU4=";
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
