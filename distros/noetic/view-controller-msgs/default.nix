
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, genmsg, geometry-msgs, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-view-controller-msgs";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "view_controller_msgs-release";
    rev = "72c85de4b593a54ce9d403d0c4fd9080fe5224b9";
    owner = "ros-gbp";
    sha256 = "sha256-HVswly+YiZAEVU8VXD/fq/u/HBI7ZG71PHm4e3OD1vM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin genmsg message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages for (camera) view controllers'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
