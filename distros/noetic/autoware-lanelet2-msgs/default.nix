
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-autoware-lanelet2-msgs";
  version = "1.14.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "messages-release";
    rev = "fd4003fe6c1a8f49a1a91f9e1edc79083b25c747";
    owner = "autoware-ai";
    sha256 = "sha256-TE9EkqOEUSUa7lmZRTxUGB1jF5iToF7To+fqLBCMiL4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The autoware_lanelet2_msgs package. Contains messages for lanelet2 maps'';
    license = with lib.licenses; [ asl20 ];
  };
}
