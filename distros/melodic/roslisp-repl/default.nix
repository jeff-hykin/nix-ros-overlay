
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosemacs, roslisp, sbcl, slime-ros, slime-wrapper }:
buildRosPackage {
  pname = "ros-melodic-roslisp-repl";
  version = "0.4.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_emacs_utils-release";
    rev = "755dce27b54021382e06f02a0361f82a2bf34db0";
    owner = "code-iai-release";
    sha256 = "sha256-8sjVcWIp97peXmu9Twqt+cU6k10a+HU7yX2V9GFhVy8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rosemacs roslisp sbcl slime-ros slime-wrapper ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides a script that launches Emacs with Slime (the
    Superior Lisp Interaction Mode) ready for Lisp development and
    roslisp.'';
    license = with lib.licenses; [ publicDomain ];
  };
}
