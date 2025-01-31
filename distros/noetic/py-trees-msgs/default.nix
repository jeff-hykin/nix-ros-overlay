
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, dynamic-reconfigure, message-generation, message-runtime, std-msgs, uuid-msgs }:
buildRosPackage {
  pname = "ros-noetic-py-trees-msgs";
  version = "0.3.7-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "py_trees_msgs-release";
    rev = "fa45496c1c23b55afd3e256b2ed2328bf02134af";
    owner = "stonier";
    sha256 = "sha256-+SGAsgz2JiPW3tfms+GmBsQwcF9Vus+TlUf4wT2yqno=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib-msgs dynamic-reconfigure message-runtime std-msgs uuid-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages used by py_trees_ros and some extras for the mock demos/tests.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
