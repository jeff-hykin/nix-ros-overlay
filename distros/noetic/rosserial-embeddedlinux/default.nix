
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rospy, rosserial-client, rosserial-msgs }:
buildRosPackage {
  pname = "ros-noetic-rosserial-embeddedlinux";
  version = "0.9.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosserial-release";
    rev = "2c03804aac1c023ebed4f9dc8228d8cd64a166aa";
    owner = "ros-gbp";
    sha256 = "sha256-RLmjKBVsJWrF8zZBEF6EhkNqODtvUEaXPe7UNpl4Njc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin rosserial-client ];
  propagatedBuildInputs = [ rospy rosserial-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rosserial for embedded Linux enviroments'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
