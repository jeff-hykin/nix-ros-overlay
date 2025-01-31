
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, genmsg, geometry-msgs, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-view-controller-msgs";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "view_controller_msgs-release";
    rev = "ad8efe83f69d55b141d288b006076a9ee184031d";
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
