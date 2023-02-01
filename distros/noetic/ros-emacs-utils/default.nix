
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosemacs, roslisp-repl, slime-ros, slime-wrapper }:
buildRosPackage {
  pname = "ros-noetic-ros-emacs-utils";
  version = "0.4.17-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_emacs_utils-release";
    rev = "ca7530b4370c8bb32ee0da9752cb51a2c7092311";
    owner = "code-iai-release";
    sha256 = "sha256-pPJNq0I8lx6k3KUVU78xKEJFwhNB2bmg/TlFleSVSTw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rosemacs roslisp-repl slime-ros slime-wrapper ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A metapackage of Emacs utils for ROS.
    Only there for simplifying the release process.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
