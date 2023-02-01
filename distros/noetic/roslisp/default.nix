
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ros-environment, rosgraph-msgs, roslang, rospack, sbcl, std-srvs }:
buildRosPackage {
  pname = "ros-noetic-roslisp";
  version = "1.9.24-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roslisp-release";
    rev = "8934e5a5915db1cf5cbdc0b9cbf8f045d861d5c0";
    owner = "ros-gbp";
    sha256 = "sha256-IDP0xaGdzWf3vimDdWw6utA3oVzIH/AmuVH+boFX+NE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ros-environment rosgraph-msgs roslang rospack sbcl std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Lisp client library for ROS, the Robot Operating System.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
