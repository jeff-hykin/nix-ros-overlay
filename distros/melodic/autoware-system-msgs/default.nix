
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, rosgraph-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-autoware-system-msgs";
  version = "1.14.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "messages-release";
    rev = "18f85560332e7090724b2c25c5a55eb642102de2";
    owner = "autoware-ai";
    sha256 = "sha256-SIEfTLBAP2uML4EY0BlOP14wFdi7FHjb29c79rzNEkU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime rosgraph-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The autoware_system_msgs package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
