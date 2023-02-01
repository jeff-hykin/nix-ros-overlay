
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, nav-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-tuw-multi-robot-msgs";
  version = "0.0.13";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tuw_msgs-release";
    rev = "eac5888c546690ea15c88102de93672dd1cd0f9a";
    owner = "tuw-robotics";
    sha256 = "sha256-Fc+ZurE1HnGJ6L1ZOg/JLH4vHZ4DKtFKXwMPqdt8IM8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime nav-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The tuw_multi_robot_msgs package contains messages for sending graph, route and sync data over topics.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
